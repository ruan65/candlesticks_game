import 'dart:math';

import 'package:flutter/material.dart';

import 'models/candlestick_model.dart';

class CandlestickWidget extends StatelessWidget {
  final CandlestickModel candlestickModel;
  final double candleWidth;

  const CandlestickWidget({
    super.key,
    required this.candlestickModel,
    this.candleWidth = 30,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(candleWidth,
          max(candlestickModel.open, candlestickModel.close).abs()),
      painter: CandlestickPainter(candlestickModel),
    );
  }
}

class CandlestickPainter extends CustomPainter {
  final CandlestickModel candlestickModel;

  CandlestickPainter(this.candlestickModel);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = candlestickModel.open < candlestickModel.close
          ? Colors.green
          : Colors.red
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    double bodyHeight = (candlestickModel.open - candlestickModel.close).abs();

    double candleWidth = size.width;
    double candleHeight = size.height;

    double bodyY =
        candleHeight - max(candlestickModel.open, candlestickModel.close);
    double topShadowY = candleHeight - candlestickModel.high;
    double bottomShadowY = candleHeight - candlestickModel.low;

    canvas.drawLine(
      Offset(candleWidth / 2, topShadowY),
      Offset(candleWidth / 2, bottomShadowY),
      paint,
    );

    canvas.drawRect(
      Rect.fromPoints(
        // Offset(candleWidth / 4, bodyY),
        // Offset(3 * candleWidth / 4, bodyY + bodyHeight),
        Offset(candleWidth / 6, bodyY),
        Offset(5 * candleWidth / 6, bodyY + bodyHeight),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
