abstract class CryptoEvent {}

class LoadCryptoEvent extends CryptoEvent {
  final String symbol;

  LoadCryptoEvent({required this.symbol});
}
