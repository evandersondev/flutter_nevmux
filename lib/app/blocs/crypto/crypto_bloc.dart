import 'package:bloc/bloc.dart';

import 'package:flutter_nexmuv/app/blocs/crypto/crypto_event.dart';
import 'package:flutter_nexmuv/app/blocs/crypto/crypto_state.dart';
import 'package:flutter_nexmuv/app/interfaces/crypto_repository_interface.dart';
import 'package:flutter_nexmuv/app/models/crypto_model.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final ICryptoRepository repository;

  List<CryptoModel> _crypto = [];
  get crypto => _crypto;

  CryptoBloc({required this.repository}) : super(InitialCryptoState()) {
    on<LoadCryptoEvent>((event, emit) async {
      emit(LoadingCryptoState());

      _crypto = await repository.load(event.symbol);
      emit(LoadedCryptoState(_crypto));
    });
  }
}
