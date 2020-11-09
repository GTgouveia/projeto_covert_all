class Moeda {
  String code;
  String codein;
  String name;
  num high;
  num low;
  num varBid;
  num pctChange;
  num bid;
  num ask;
  String createDate;

  Moeda(Map map) {
    this.code = map['code'];
    this.codein = map['codein'];
    this.name = map['name'];
    this.high = num.parse(map['high']); //"3,8906",
    this.low = num.parse(map['low']); //"3,8596",
    this.varBid = num.parse(map['varBid']); //"-0,0138",
    this.pctChange = num.parse(map['pctChange']); //"-0,36",
    this.bid = num.parse(map['bid']); //"3,8660",
    this.bid = num.parse(map['ask']); //"3,8680",
    this.createDate = map['create_date']; //"2019-04-15 17:27:50"
  }
}
