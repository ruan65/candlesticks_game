import 'dart:convert';

import 'package:card/candlesticks/models/candlestick_model.dart';

List<CandlestickModel> parseCandlestickModels(String jsonData) {
  final jsonList = json.decode(jsonData) as List<dynamic>;
  return jsonList
      .map((jsonItem) => CandlestickModel.fromJson(jsonItem as Map<String, dynamic>))
      .toList();
}

List<CandlestickModel> parseCandlestickModelsFromJsonList(List<Map<String, dynamic>> jsonList) {
  return jsonList.map((jsonItem) => CandlestickModel.fromJson(jsonItem)).toList();
}

void main() {
  // String jsonData = '''
  // [
  //   {
  //     "open": 1.35,
  //     "close": 1.47,
  //     "high": 1.50,
  //     "low": 1.30
  //   },
  //   {
  //     "open": 1.48,
  //     "close": 1.55,
  //     "high": 1.58,
  //     "low": 1.47
  //   },
  //   {
  //     "open": 1.56,
  //     "close": 1.59,
  //     "high": 1.62,
  //     "low": 1.53
  //   }
  // ]
  // ''';
  //
  // List<CandlestickModel> candlesticks = parseCandlestickModels(jsonData);

  List<Map<String, dynamic>> jsonData = [
    {
      "open": 1.35,
      "close": 1.47,
      "high": 1.50,
      "low": 1.30
    },
    {
      "open": 1.48,
      "close": 1.55,
      "high": 1.58,
      "low": 1.47
    },
    {
      "open": 1.56,
      "close": 1.59,
      "high": 1.62,
      "low": 1.53
    }
  ];

  List<CandlestickModel> candlesticks = parseCandlestickModelsFromJsonList(jsonData);

  // Для проверки, выведем информацию о каждом свечном столбце
  for (var candlestick in candlesticks) {
    print('Open: ${candlestick.open}, Close: ${candlestick.close}, High: ${candlestick.high}, Low: ${candlestick.low}');
  }

  for (var candlestick in candlesticks) {
    print('Open: ${candlestick.open}, Close: ${candlestick.close}, High: ${candlestick.high}, Low: ${candlestick.low}');
  }
}