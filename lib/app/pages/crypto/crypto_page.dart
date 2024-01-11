import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_nexmuv/app/blocs/crypto/crypto_bloc.dart';
import 'package:flutter_nexmuv/app/blocs/crypto/crypto_event.dart';
import 'package:flutter_nexmuv/app/blocs/crypto/crypto_state.dart';
import 'package:flutter_nexmuv/app/pages/crypto/widgets/chart_widget.dart';
import 'package:flutter_nexmuv/app/pages/crypto/widgets/crypto_card_widget.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({
    super.key,
    required this.symbol,
  });

  final String symbol;

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  late final CryptoBloc cryptoBloc;

  @override
  void initState() {
    super.initState();

    cryptoBloc = GetIt.instance.get<CryptoBloc>();
    cryptoBloc.add(LoadCryptoEvent(symbol: widget.symbol));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.symbol)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: BlocBuilder<CryptoBloc, CryptoState>(
          bloc: cryptoBloc,
          builder: (context, state) {
            if (state is LoadingCryptoState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is LoadedCryptoState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FadeInDown(
                        from: 50,
                        child: ChartWidget(crypto: cryptoBloc.crypto),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.crypto.length,
                        itemBuilder: (context, index) {
                          return FadeInUp(
                            from: index * 50,
                            child: CryptoCardWidget(
                              crypto: state.crypto[index],
                              firstQuote: state.crypto.first.quote,
                              penultimateQuote: index != 0
                                  ? state.crypto[index - 1].quote
                                  : state.crypto[index].quote,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
