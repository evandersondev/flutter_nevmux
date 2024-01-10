import 'package:flutter/material.dart';

import 'package:flutter_nexmuv/app/app_widget.dart';
import 'package:flutter_nexmuv/app/inject/inject.dart';

void main() {
  Inject.init();

  runApp(const AppWidget());
}
