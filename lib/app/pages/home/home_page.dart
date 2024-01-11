import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_nexmuv/app/constants/symbols.dart';
import 'package:flutter_nexmuv/app/controllers/home_controller.dart';
import 'package:flutter_nexmuv/app/controllers/theme_controller.dart';
import 'package:flutter_nexmuv/app/pages/home/widgets/symbol_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController homeController;

  @override
  void initState() {
    super.initState();

    homeController = GetIt.instance.get<HomeController>();
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: ListView.builder(
          itemCount: symbols.length,
          itemBuilder: (context, index) {
            return FadeInUp(
              from: index * 50,
              child: SymbolCardWidget(
                symbolName: symbols[index][0],
                symbolLegend: symbols[index][1],
                onTap: homeController.navigateToCryptoPage,
              ),
            );
          },
        ),
      ),
    );
  }
}
