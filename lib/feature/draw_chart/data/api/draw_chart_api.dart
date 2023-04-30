// ignore_for_file: missing_whitespace_between_adjacent_strings, avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'package:chart_gpt/app/errors/exceptions.dart';
import 'package:chart_gpt/core/network/network_client.dart';

import 'package:chart_gpt/feature/draw_chart/data/model/chart_model.dart';

class DrawChartApi {
  DrawChartApi({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  Future<List<ChartModel>> drawChart({required String message}) async {
    try {
      final response = await _networkClient.post<Map<String, dynamic>>(
        '/chat/completions',
        data: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'max_tokens': 512,
          'messages': [
            {
              'role': 'user',
              'content':
                  'Generate a valid JSON in which each element is an object by obeying this FORMAT and naming convention: [{ "key": "abc", "value": 0}] for the following description for a chart. $message'
            }
          ]
        }),
      );

      final model = response.data;
      if (model == null) {
        throw NetworkException();
      } else {
        final content = model['choices'][0]['message']['content'] as String;
        final contentList = jsonDecode(content) as List<dynamic>;

        return contentList.map((e) => ChartModel.fromJson(e as Map<String, dynamic>)).toList();
      }
    } catch (e) {
      log(e.toString());
      throw NetworkException();
    }
  }
}
