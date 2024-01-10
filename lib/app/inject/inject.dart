import 'package:get_it/get_it.dart';

import 'package:flutter_nexmuv/app/blocs/crypto/crypto_bloc.dart';
import 'package:flutter_nexmuv/app/http/http.dart';
import 'package:flutter_nexmuv/app/http/uno_client.dart';
import 'package:flutter_nexmuv/app/repositories/crypto_repository.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IHTTP>(() => UnoClient());

    getIt.registerLazySingleton<ICryptoRepository>(
        () => CryptoRepository(client: getIt()));

    getIt.registerFactory<CryptoBloc>(() => CryptoBloc(repository: getIt()));
  }
}
