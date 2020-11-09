import 'dart:convert';

import 'package:convert_all/Constants/Constants.dart';
import 'package:convert_all/Functions/MoedasPage.functions.dart';
import 'package:convert_all/Models/Moeda.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoedasPage extends StatefulWidget {
  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  Future<Map> moedas() async {
    final response =
        await http.get("https://economia.awesomeapi.com.br/json/all");

    if (response.statusCode == 200) {
      // se o servidor retornar um response OK, vamos fazer o parse no JSON
      return json.decode(response.body);
    } else {
      // se a responsta não for OK , lançamos um erro
      throw Exception('Failed to load post');
    }
  }

  TextEditingController _controllerMoeda1 = TextEditingController();
  TextEditingController _controllerMoeda2 = TextEditingController();
  Moeda moeda1;
  Moeda moeda2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            Constants.moedas,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Constants.titulo1),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: FlatButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text("Moedas"),
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 1.7,
                                  child: StreamBuilder(
                                      stream: moedas().asStream(),
                                      builder: (context, snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.none:
                                          case ConnectionState.waiting:
                                            return Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  CircularProgressIndicator(),
                                                ],
                                              ),
                                            );
                                          default:
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.notifications_off,
                                                      color: Colors.grey,
                                                      size: 90,
                                                    ),
                                                    Text(
                                                      "Nenhuma resultado",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              List<Moeda> moedas =
                                                  MoedasPageFunctions()
                                                      .getMoedas(snapshot.data);
                                              return ListView.builder(
                                                itemCount: moedas.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    margin: EdgeInsets.all(10),
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.amber[200]),
                                                    child: FlatButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          moeda1 =
                                                              moedas[index];
                                                          _controllerMoeda1
                                                              .clear();
                                                          _controllerMoeda2
                                                              .clear();
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "${moedas[index].name} (${moedas[index].code})"),
                                                          Icon(Icons
                                                              .arrow_right),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                        }
                                      }),
                                )
                              ],
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            moeda1 == null
                                ? Text("Escolha a moeda!")
                                : Text("${moeda1.name} (${moeda1.code})"),
                            Row(
                              children: [
                                Text("Moedas"),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    moeda1 != null
                        ? Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: TextFormField(
                              controller: _controllerMoeda1,
                              decoration: InputDecoration(
                                labelText: "${moeda1.code}",
                                labelStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                  color: Colors.amber, fontSize: 25.0),
                              onChanged: (String text) {
                                if (text.isEmpty) {
                                  _controllerMoeda2.clear();
                                }
                                _controllerMoeda2.text =
                                    (moeda1.low * double.parse(text))
                                        .toStringAsFixed(4);
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    moeda1 != null
                        ? Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: TextFormField(
                              controller: _controllerMoeda2,
                              decoration: InputDecoration(
                                labelText: "${moeda1.codein}",
                                labelStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                  color: Colors.amber, fontSize: 25.0),
                              onChanged: (String text) {
                                if (text.isEmpty) {
                                  _controllerMoeda1.clear();
                                }
                                _controllerMoeda1.text =
                                    (double.parse(text) / moeda1.low)
                                        .toStringAsFixed(4);
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
