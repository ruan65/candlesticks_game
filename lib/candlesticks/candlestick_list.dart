import 'package:flutter/material.dart';

import 'candle_stick_widget.dart';
import 'candlestick_model.dart';

class CandlestickList extends StatelessWidget {
  final List<CandlestickModel> candlestickModels;
  final double itemHeight;
  final double candleWidth;

  const CandlestickList({super.key,
    required this.candlestickModels,
    required this.itemHeight,
    required this.candleWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: candlestickModels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CandlestickWidget(
              candlestickModel: candlestickModels[index],
              candleWidth: candleWidth,
            ),
          );
        },
      ),
    );
  }
}
