import 'package:flutter/material.dart';

import 'package:animated_icon_button/animated_icon_button.dart';

import 'package:flutter_nexmuv/app/constants/symbols.dart';
import 'package:flutter_nexmuv/app/controllers/theme_controller.dart';
import 'package:flutter_nexmuv/app/pages/home/widgets/symbol_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptos'),
        actions: [
          AnimatedIconButton(
            onPressed: () {
              ThemeController.instance.toggleTheme();
            },
            icons: [
              AnimatedIconItem(
                icon: Icon(
                  Icons.brightness_2_rounded,
                  color: Colors.grey.shade400,
                ),
              ),
              const AnimatedIconItem(
                icon: Icon(
                  Icons.brightness_7_rounded,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          children: [
            ...symbols.map((symbol) {
              return SymbolCardWidget(
                symbolName: symbol[0],
                symbolLegend: symbol[1],
              );
            })
          ],
        ),
      ),
    );
  }
}
