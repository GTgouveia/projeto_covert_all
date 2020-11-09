class Temperatura {
  int id;
  String nome;
  String sigla;

  Temperatura(this.id, this.nome, this.sigla);
}

List<Temperatura> temperatuas = [
  Temperatura(1, "Celsius", "°C"),
  Temperatura(2, "Fahrenheit", "°F"),
  Temperatura(3, "Kelvin", "K"),
];
