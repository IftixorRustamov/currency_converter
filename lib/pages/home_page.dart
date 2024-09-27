import 'package:currency_converter/config/color_config.dart';
import 'package:currency_converter/config/text_config.dart';
import 'package:currency_converter/mixin.dart';
import 'package:currency_converter/widgets/change_currency_button.dart';
import 'package:currency_converter/widgets/converter_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMethods {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ConfigText.title,
          style: TextStyle(
              color: ConfigColors.darkBlue,
              fontSize: 27,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                textAlign: TextAlign.center,
                ConfigText.subtitle,
                style: TextStyle(
                  color: ConfigColors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                color: ConfigColors.white,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ConfigText.amountText,
                        style:
                            TextStyle(fontSize: 15, color: ConfigColors.grey),
                      ),
                      const SizedBox(height: 10),
                      isReversed
                          ? ConverterField(
                              controller: controllerUsd,
                              text: ConfigText.usd,
                              imageUrl: "assets/images/flag_us.jpg",
                              onSubmitted: (value) => convertCurrency,
                            )
                          : ConverterField(
                              controller: controllerUzs,
                              text: ConfigText.uzs,
                              imageUrl: "assets/images/flag_uz.jpg",
                              onSubmitted: (value) => convertCurrency,
                            ),
                      const SizedBox(height: 20),
                      ChangeCurrencyButton(
                        onPressed: changeCurrency,
                      ),
                      const SizedBox(height: 20),
                      isReversed
                          ? ConverterField(
                              controller: controllerUzs,
                              text: ConfigText.uzs,
                              imageUrl: "assets/images/flag_uz.jpg",
                            )
                          : ConverterField(
                              controller: controllerUsd,
                              text: ConfigText.usd,
                              imageUrl: "assets/images/flag_us.jpg",
                            ),
                    ],
                  ),
                ),
              ),
              const Text(
                ConfigText.exchangeResText,
                style: TextStyle(color: ConfigColors.grey, fontSize: 16),
              ),
              Text(
                resultText,
                style: const TextStyle(
                    color: ConfigColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
