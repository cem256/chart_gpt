import 'package:chart_gpt/app/theme/theme_constants.dart';
import 'package:chart_gpt/core/extensions/context_extensions.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/cubit/draw_chart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphTypes extends StatelessWidget {
  GraphTypes({
    required this.selectedIndex,
    super.key,
  });

  final int selectedIndex;
  final List<String> graphTypes = ['Bar', 'Column', 'Line', 'Area'];

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
                  ? context.theme.colorScheme.secondaryContainer
                  : context.theme.colorScheme.secondary,
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
