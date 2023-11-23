import 'dart:math';

import 'candlestick_model.dart';
import 'package:flutter/material.dart';

class CandlestickWidget extends StatelessWidget {
  final CandlestickModel candlestickModel;
  final double candleWidth;

  const CandlestickWidget({
    super.key,
    required this.candlestickModel,
    this.candleWidth = 10,
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
    Paint linePaint = Paint()
      ..color = candlestickModel.open < candlestickModel.close
          ? Colors.green
          : Colors.red
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    Paint rectPaint = Paint()
      ..color = candlestickModel.open < candlestickModel.close
          ? Colors.green
          : Colors.red
      ..style = PaintingStyle.fill;

    double bodyHeight = (candlestickModel.open - candlestickModel.close).abs();
    double topShadowHeight = (candlestickModel.high -
            max(candlestickModel.open, candlestickModel.close))
        .abs();
    double bottomShadowHeight =
        (min(candlestickModel.open, candlestickModel.close) -
                candlestickModel.low)
            .abs();

    double candleWidth = size.width;
    double candleHeight = size.height;

    double bodyY =
        candleHeight - max(candlestickModel.open, candlestickModel.close);
    double topShadowY = candleHeight - candlestickModel.high;
    double bottomShadowY = candleHeight - candlestickModel.low;

    // Draw top shadow
    canvas.drawLine(
      Offset(candleWidth / 2, topShadowY),
      Offset(candleWidth / 2, topShadowY + topShadowHeight),
      linePaint,
    );

    // Draw bottom shadow
    canvas.drawLine(
      Offset(candleWidth / 2, bottomShadowY),
      Offset(candleWidth / 2, bottomShadowY - bottomShadowHeight),
      linePaint,
    );

    // Draw candle body
    canvas.drawRect(
      Rect.fromPoints(
        Offset(candleWidth / 4, bodyY),
        Offset(3 * candleWidth / 4, bodyY + bodyHeight),
      ),
      rectPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
