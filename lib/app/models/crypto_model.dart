import 'dart:convert';

class CryptoModel {
  final String symbol;
  final int timestamp;
  final double quote;
  CryptoModel({
    required this.symbol,
    required this.timestamp,
    required this.quote,
  });

  CryptoModel copyWith({
    String? symbol,
    int? timestamp,
    double? quote,
  }) {
    return CryptoModel(
      symbol: symbol ?? this.symbol,
      timestamp: timestamp ?? this.timestamp,
      quote: quote ?? this.quote,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'symbol': symbol});
    result.addAll({'timestamp': timestamp});
    result.addAll({'quote': quote});

    return result;
  }

  factory CryptoModel.fromMap(Map<String, dynamic> map) {
    return CryptoModel(
      symbol: map['symbol'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
      quote: map['quote']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoModel.fromJson(String source) =>
      CryptoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CryptoModel(symbol: $symbol, timestamp: $timestamp, quote: $quote)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoModel &&
        other.symbol == symbol &&
        other.timestamp == timestamp &&
        other.quote == quote;
  }

  @override
  int get hashCode => symbol.hashCode ^ timestamp.hashCode ^ quote.hashCode;
}
