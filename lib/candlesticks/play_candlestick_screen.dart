import 'package:card/candlesticks/candlestick_list.dart';
import 'package:card/candlesticks/db/repository.dart';
import 'package:card/candlesticks/models/candlestick_model.dart';
import 'package:card/candlesticks/models/parcer.dart';
import 'package:card/style/my_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayCandlestickScreen extends StatelessWidget {
  const PlayCandlestickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _gap,
        MyButton(
          onPressed: () => GoRouter.of(context).go('/'),
          child: const Text('Back'),
        ),
        _gap,
        CandlestickList(
          candlestickModels: parseCandlestickModelsFromJsonList(jsonData),
          candleWidth: 30,
          itemHeight: 100,
        ),
      ],
    );
  }

  static const _gap = SizedBox(height: 50);
}

// final pattern = [
//   CandlestickModel(open: 90, close: 70, high: 100, low: 0),
//   CandlestickModel(open: 20, close: 70, high: 100, low: -110),
//   CandlestickModel(open: 20, close: 70, high: 90, low: 10),
// ];
