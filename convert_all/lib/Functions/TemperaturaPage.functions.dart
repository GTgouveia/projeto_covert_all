class TemperaturaPageFunctions {
  List<Function> listFunctions = [
    (double cForF) {
      //grau Celsius para	grau Fahrenheit
      return cForF * 1.8 + 32;
    },
    (double fForC) {
      //grau Fahrenheit	para grau Celsius
      return (fForC - 32) / 1.8;
    },
    (double cForK) {
      //grau Celsius para	kelvin
      return cForK + 273.15;
    },
    (double kForC) {
      //kelvin para	grau Celsius
      return kForC - 273.15;
    },
    (double fForK) {
      //grau fahrenheit para	kelvin
      return (fForK + 459.67) / 1.8;
    },
    (double kForF) {
      //Kelvin para grau fahrenheit
      return kForF * 1.8 - 459.67;
    },
  ];
}
