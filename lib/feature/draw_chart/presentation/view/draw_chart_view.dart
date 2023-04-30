import 'package:chart_gpt/app/enums/page_status.dart';
import 'package:chart_gpt/app/theme/theme_constants.dart';
import 'package:chart_gpt/core/extensions/context_extensions.dart';
import 'package:chart_gpt/core/extensions/widget_extensions.dart';
import 'package:chart_gpt/core/network/network_client.dart';
import 'package:chart_gpt/core/utils/snackbar/snackbar_utils.dart';
import 'package:chart_gpt/feature/draw_chart/data/api/draw_chart_api.dart';
import 'package:chart_gpt/feature/draw_chart/data/repository/draw_chart_repository.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/cubit/draw_chart_cubit.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/widgets/area_chart.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/widgets/bar_chart.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/widgets/column_chart.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawChartView extends StatelessWidget {
  const DrawChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chart GPT')),
      body: BlocProvider(
        create: (context) => DrawChartCubit(
          drawChartRepository: DrawChartRepository(
            drawChartApi: DrawChartApi(
              networkClient: NetworkClient(),
            ),
          ),
        ),
        child: const _DrawChartViewBody(),
      ),
    );
  }
}

class _DrawChartViewBody extends StatefulWidget {
  const _DrawChartViewBody();

  @override
  State<_DrawChartViewBody> createState() => _DrawChartViewBodyState();
}

class _DrawChartViewBodyState extends State<_DrawChartViewBody> {
  late final TextEditingController _textEditingController;
  late final List<String> graphTypes;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    graphTypes = ['Bar', 'Column', 'Line', 'Area'];
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawChartCubit, DrawChartState>(
      listener: (context, state) {
        if (state.isValidInput == false) {
          SnackbarUtils.showSnackbar(context: context, message: 'Text area cannot be empty');
        }
      },
      child: Padding(
        padding: context.paddingAllDefault,
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Example: \nUSA = 900 \nBrazil = 1100 \nItaly = 1200 \nTurkey = 1000',
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => context.read<DrawChartCubit>().drawChart(message: _textEditingController.text),
              ),
              ElevatedButton(
                onPressed: () => context.read<DrawChartCubit>().drawChart(message: _textEditingController.text),
                child: const Text('Draw Chart'),
              ),
              BlocSelector<DrawChartCubit, DrawChartState, int>(
                selector: (state) => state.selectedIndex,
                builder: (context, selectedIndex) {
                  return GraphTypes(
                    selectedIndex: selectedIndex,
                    graphTypes: graphTypes,
                  );
                },
              ),
              Expanded(
                child: BlocSelector<DrawChartCubit, DrawChartState, PageStatus>(
                  selector: (state) {
                    return state.status;
                  },
                  builder: (context, pageStatus) {
                    switch (pageStatus) {
                      case PageStatus.initial:
                        return const Center(
                          child: Text('Enter data to generate charts'),
                        );

                      case PageStatus.loading:
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );

                      case PageStatus.success:
                        return BlocBuilder<DrawChartCubit, DrawChartState>(
                          builder: (context, state) {
                            if (state.selectedIndex == 0) {
                              return BarChart(chartData: state.chartData);
                            } else if (state.selectedIndex == 1) {
                              return ColumnChart(chartData: state.chartData);
                            } else if (state.selectedIndex == 2) {
                              return LineChart(chartData: state.chartData);
                            } else {
                              return AreaChart(chartData: state.chartData);
                            }
                          },
                        );

                      case PageStatus.failure:
                        return const Center(
                          child: Text('Something went wrong try again.'),
                        );
                    }
                  },
                ),
              ),
            ].spaceBetween(height: context.mediumValue),
          ),
        ),
      ),
    );
  }
}

class GraphTypes extends StatelessWidget {
  const GraphTypes({
    required this.selectedIndex,
    required this.graphTypes,
    super.key,
  });

  final int selectedIndex;
  final List<String> graphTypes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(graphTypes.length, (index) {
        return GestureDetector(
          onTap: () => context.read<DrawChartCubit>().selectedIndexChanged(index: index),
          child: Container(
            padding: context.paddingAllDefault,
            decoration: BoxDecoration(
              borderRadius: ThemeConstants.borderRadiusCircular,
              color: index == selectedIndex
                  ? context.theme.colorScheme.primaryContainer
                  : context.theme.colorScheme.secondaryContainer,
            ),
            child: Center(
              child: Text(
                graphTypes[index],
              ),
            ),
          ),
        );
      }),
    );
  }
}
