import 'dart:convert';

class CandlestickModel {
  final double open;
  final double close;
  final double high;
  final double low;

  CandlestickModel({
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });

  factory CandlestickModel.fromJson(Map<String, dynamic> json) {
    return CandlestickModel(
      open: json['open']?.toDouble() ?? 0.0,
      close: json['close']?.toDouble() ?? 0.0,
      high: json['high']?.toDouble() ?? 0.0,
      low: json['low']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'open': open,
      'close': close,
      'high': high,
      'low': low,
    };
  }

  CandlestickModel copyWith({
    double? open,
    double? close,
    double? high,
    double? low,
  }) {
    return CandlestickModel(
      open: open ?? this.open,
      close: close ?? this.close,
      high: high ?? this.high,
      low: low ?? this.low,
    );
  }
}
