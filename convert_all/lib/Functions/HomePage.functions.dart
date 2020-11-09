import 'package:convert_all/Pages/Moedas/Moedas.page.dart';
import 'package:convert_all/Pages/Temperaturas/Temperaturas.page.dart';
import 'package:flutter/material.dart';

class HomePageFunctionsTabBar {
  List<Widget> converts = [
    SingleChildScrollView(child: MoedasPage()),
    SingleChildScrollView(child: TemperaturasPage()),
  ];
}
