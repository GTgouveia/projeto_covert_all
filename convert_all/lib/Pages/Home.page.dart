import 'package:convert_all/Constants/Constants.dart';
import 'package:convert_all/Functions/HomePage.functions.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int escolhaConversao;

  @override
  void initState() {
    super.initState();
    escolhaConversao = 0;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.nomeApp,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Builder(
        builder: (context) => DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: Colors.black,
                labelPadding: EdgeInsets.all(20),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[500],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Image.asset(
                        Constants.iconePNGMoedas,
                        height: 100,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[500],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Image.asset(
                        Constants.iconePNGTemperaturas,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child:
                      TabBarView(children: HomePageFunctionsTabBar().converts))
            ],
          ),
        ),
      ),
    );
  }
}
