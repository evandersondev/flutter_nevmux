import 'package:flutter/material.dart';

import 'package:flutter_nexmuv/app/pages/crypto/crypto_page.dart';

class HomeController {
  void navigateToCryptoPage(
      {required BuildContext context, required symbolName}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CryptoPage(
          symbol: symbolName,
        ),
      ),
    );
  }
}
