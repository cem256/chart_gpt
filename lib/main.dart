import 'package:chart_gpt/app/env/env.dart';
import 'package:chart_gpt/app/theme/cubit/theme_cubit.dart';
import 'package:chart_gpt/app/theme/dark/dark_theme.dart';
import 'package:chart_gpt/app/theme/light/light_theme.dart';
import 'package:chart_gpt/core/utils/observer/bloc_observer.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/view/draw_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    dotenv.load(fileName: Env.fileName)
  ]);

  runApp(const ChartGPT());
}

class ChartGPT extends StatelessWidget {
  const ChartGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ChartGPT',
            themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: LightTheme().theme,
            darkTheme: DarkTheme().theme,
            home: const DrawChartView(),
          );
        },
      ),
    );
  }
}
