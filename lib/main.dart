import 'package:chart_gpt/app/env/env.dart';
import 'package:chart_gpt/app/theme/light/light_theme.dart';
import 'package:chart_gpt/core/utils/observer/bloc_observer.dart';
import 'package:chart_gpt/feature/draw_chart/presentation/view/draw_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChartGPT',
      theme: LightTheme().theme,
      home: const DrawChartView(),
    );
  }
}
