import 'package:currency_converter/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

mixin HomeMethods on State<HomePage> {
  final TextEditingController controllerUzs = TextEditingController();
  final TextEditingController controllerUsd = TextEditingController();
  bool isReversed = false;
  String resultText = "";

  double usdToUzs() {
    double res = 0;
    res = double.parse(controllerUsd.text) * 12733.87;
    return res;
  }

  double uzsToUsd() {
    double res = 0;
    res = double.parse(controllerUzs.text) * 0.000079;
    return res;
  }

  void convertCurrency() {
    setState(() {
      double res = isReversed ? usdToUzs() : uzsToUsd();
      resultText = res.toStringAsFixed(2); // or any format you prefer
    });
  }

  void changeCurrency() {
    setState(() {
      isReversed = !isReversed;
      convertCurrency();
    });
  }
}
