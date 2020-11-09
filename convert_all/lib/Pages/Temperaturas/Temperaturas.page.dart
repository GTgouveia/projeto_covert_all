import 'package:convert_all/Constants/Constants.dart';
import 'package:convert_all/Models/Temperatura.model.dart';
import 'package:flutter/material.dart';

class TemperaturasPage extends StatefulWidget {
  @override
  _TemperaturasPageState createState() => _TemperaturasPageState();
}

class _TemperaturasPageState extends State<TemperaturasPage> {
  TextEditingController _controllerTemperatura1 = TextEditingController();
  TextEditingController _controllerTemperatura2 = TextEditingController();
  Temperatura temperatura1;
  Temperatura temperatura2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            Constants.temperaturas,
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
                padding: EdgeInsets.all(20),
                child: Text(Constants.titulo2),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                        title: Text("Temperaturas"),
                        children: [
                          for (Temperatura temperatura in temperatuas)
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 50,
                              decoration:
                                  BoxDecoration(color: Colors.blue[200]),
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    temperatura1 = temperatura;
                                    _controllerTemperatura1.clear();
                                    _controllerTemperatura2.clear();
                                  });
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${temperatura.nome} (${temperatura.sigla})"),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      temperatura1 == null
                          ? Text("Escolha a temperatura!")
                          : Text(
                              "${temperatura1.nome} (${temperatura1.sigla})"),
                      Row(
                        children: [
                          Text("Temperaturas"),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _controllerTemperatura1,
                  decoration: InputDecoration(
                    labelText:
                        temperatura1 == null ? "" : "${temperatura1.sigla}",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  onChanged: (String text) {
                    if (text.isEmpty) {
                      _controllerTemperatura2.clear();
                    }
                    if (temperatura2 != null) {
                      if (temperatura1.id == temperatura2.id) {
                        _controllerTemperatura2.text =
                            _controllerTemperatura1.text;
                      } else if (temperatura1.id == 1 && temperatura2.id == 2) {
                        double t = double.parse(_controllerTemperatura1.text);
                        _controllerTemperatura2.text =
                            (t * 1.8 + 32).toStringAsFixed(4).toString();
                      } else if (temperatura1.id == 1 && temperatura2.id == 3) {
                        double t = double.parse(_controllerTemperatura1.text);
                        _controllerTemperatura2.text =
                            (t + 273.15).toStringAsFixed(4).toString();
                      } else if (temperatura1.id == 2 && temperatura2.id == 1) {
                        double t = double.parse(_controllerTemperatura1.text);
                        _controllerTemperatura2.text =
                            ((t - 32) / 1.8).toStringAsFixed(4).toString();
                      } else if (temperatura1.id == 2 && temperatura2.id == 3) {
                        double t = double.parse(_controllerTemperatura1.text);
                        _controllerTemperatura2.text =
                            ((t + 459.67) / 1.8).toStringAsFixed(4).toString();
                      } else if (temperatura1.id == 3 && temperatura2.id == 1) {
                        double t = double.parse(_controllerTemperatura1.text);
                        _controllerTemperatura2.text =
                            (t - 273.15).toStringAsFixed(4).toString();
                      } else if (temperatura1.id == 3 && temperatura2.id == 2) {
                        double t = double.parse(_controllerTemperatura1.text);
                        _controllerTemperatura2.text =
                            (t * 1.8 - 459.67).toStringAsFixed(4).toString();
                      }
                    }
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),

              //
              Container(
                margin:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
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
                        title: Text("Temperaturas"),
                        children: [
                          for (Temperatura temperatura in temperatuas)
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 50,
                              decoration:
                                  BoxDecoration(color: Colors.blue[200]),
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    temperatura2 = temperatura;
                                    _controllerTemperatura1.clear();
                                    _controllerTemperatura2.clear();
                                  });
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${temperatura.nome} (${temperatura.sigla})"),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      temperatura2 == null
                          ? Text("Escolha a temperatura!")
                          : Text(
                              "${temperatura2.nome} (${temperatura2.sigla})"),
                      Row(
                        children: [
                          Text("Temperaturas"),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: TextFormField(
                  controller: _controllerTemperatura2,
                  decoration: InputDecoration(
                    labelText:
                        temperatura2 == null ? "" : "${temperatura2.sigla}",
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  onChanged: (String text) {
                    if (text.isEmpty) {
                      _controllerTemperatura1.clear();
                    }
                    if (temperatura1 != null) {
                      if (temperatura2.id == temperatura1.id) {
                        _controllerTemperatura1.text =
                            _controllerTemperatura2.text;
                      } else if (temperatura2.id == 1 && temperatura1.id == 2) {
                        double t = double.parse(_controllerTemperatura2.text);
                        _controllerTemperatura1.text =
                            (t * 1.8 + 32).toStringAsFixed(4).toString();
                      } else if (temperatura2.id == 1 && temperatura1.id == 3) {
                        double t = double.parse(_controllerTemperatura2.text);
                        _controllerTemperatura1.text =
                            (t + 273.15).toStringAsFixed(4).toString();
                      } else if (temperatura2.id == 2 && temperatura1.id == 1) {
                        double t = double.parse(_controllerTemperatura2.text);
                        _controllerTemperatura1.text =
                            ((t - 32) / 1.8).toStringAsFixed(4).toString();
                      } else if (temperatura2.id == 2 && temperatura1.id == 3) {
                        double t = double.parse(_controllerTemperatura2.text);
                        _controllerTemperatura1.text =
                            ((t + 459.67) / 1.8).toStringAsFixed(4).toString();
                      } else if (temperatura2.id == 3 && temperatura1.id == 1) {
                        double t = double.parse(_controllerTemperatura2.text);
                        _controllerTemperatura1.text =
                            (t - 273.15).toStringAsFixed(4).toString();
                      } else if (temperatura2.id == 3 && temperatura1.id == 2) {
                        double t = double.parse(_controllerTemperatura2.text);
                        _controllerTemperatura1.text =
                            (t * 1.8 - 459.67).toStringAsFixed(4).toString();
                      }
                    }
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
