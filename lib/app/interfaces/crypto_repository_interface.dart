import 'package:flutter_nexmuv/app/models/crypto_model.dart';

abstract class ICryptoRepository {
  Future<List<CryptoModel>> load(String symbol);
}
