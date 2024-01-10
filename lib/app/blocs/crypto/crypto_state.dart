import 'package:flutter_nexmuv/app/models/crypto_model.dart';

abstract class CryptoState {
  final List<CryptoModel> crypto;

  CryptoState({required this.crypto});
}

class InitialCryptoState extends CryptoState {
  InitialCryptoState() : super(crypto: []);
}

class LoadingCryptoState extends CryptoState {
  LoadingCryptoState() : super(crypto: []);
}

class LoadedCryptoState extends CryptoState {
  LoadedCryptoState(List<CryptoModel> crypto) : super(crypto: crypto);
}
