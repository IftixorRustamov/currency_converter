import 'package:flutter/material.dart';

import '../config/color_config.dart';

class ConverterField extends StatelessWidget {
  final String text;
  final String imageUrl;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  const ConverterField(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.controller,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(imageUrl),
          width: 45,
          height: 45,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
              color: ConfigColors.darkBlue,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            height: 45,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(7)),
            child: TextField(
              onSubmitted: onSubmitted,
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }
}
