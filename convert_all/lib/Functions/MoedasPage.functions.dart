import 'package:convert_all/Models/Moeda.model.dart';

class MoedasPageFunctions {
  List<Moeda> moedas = List<Moeda>();
  List<Moeda> getMoedas(Map map) {
    moedas.add(Moeda(map['USD']));
    moedas.add(Moeda(map['USDT']));
    moedas.add(Moeda(map['CAD']));
    moedas.add(Moeda(map['EUR']));
    moedas.add(Moeda(map['GBP']));
    moedas.add(Moeda(map['ARS']));
    moedas.add(Moeda(map['BTC']));
    moedas.add(Moeda(map['LTC']));
    moedas.add(Moeda(map['JPY']));
    moedas.add(Moeda(map['CHF']));
    moedas.add(Moeda(map['AUD']));
    moedas.add(Moeda(map['CNY']));
    moedas.add(Moeda(map['ILS']));
    moedas.add(Moeda(map['ETH']));
    moedas.add(Moeda(map['XRP']));
    return this.moedas;
  }
}
