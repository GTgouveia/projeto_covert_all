import 'package:convert_all/Pages/Home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.purple[800],
        primaryColor: Colors.purple[800],
        bottomAppBarColor: Colors.purple[800],
        buttonColor: Colors.purple[800],
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt'),
      ],
      home: HomePage(),
    );
  }
}
