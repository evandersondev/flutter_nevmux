import 'package:uno/uno.dart';

import 'package:flutter_nexmuv/app/http/http.dart';

class UnoClient implements IHTTP {
  final uno = Uno();

  @override
  Future get(String url) {
    return uno.get(url);
  }
}
