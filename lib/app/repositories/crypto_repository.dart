import 'package:flutter/foundation.dart';

import 'package:uno/uno.dart';

import 'package:flutter_nexmuv/app/http/http.dart';
import 'package:flutter_nexmuv/app/models/crypto_model.dart';

abstract class ICryptoRepository {
  Future<List<CryptoModel>> load(String symbol);
}

class CryptoRepository implements ICryptoRepository {
  CryptoRepository({required this.client});

  final IHTTP client;
  final firstQuote = ValueNotifier<double>(0.0);

  @override
  Future<List<CryptoModel>> load(String symbol) async {
    List<CryptoModel> currencies = [];

    final response = await client.get(
        'https://query2.finance.yahoo.com/v8/finance/chart/$symbol?range=1mo&interval=1d');

    final timestampLentgh =
        response.data['chart']['result'][0]['timestamp'].length as int;

    for (var i = 0; i < timestampLentgh; i++) {
      currencies.add(CryptoModel.fromMap({
        'symbol': symbol,
        'timestamp': response.data['chart']['result'][0]['timestamp'][i],
        'quote': response.data['chart']['result'][0]['indicators']['quote'][0]
            ['open'][i],
      }));
    }

    return currencies;
  }
}
