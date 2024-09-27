import 'package:flutter/material.dart';

import '../config/color_config.dart';

class ChangeCurrencyButton extends StatelessWidget {
  final void Function()? onPressed;

  const ChangeCurrencyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(
          height: 2,
          color: ConfigColors.grey,
        ),
        IconButton(
          color: ConfigColors.darkBlue,
          onPressed: onPressed,
          icon: const Icon(
            Icons.change_circle,
            size: 70,
          ),
        )
      ],
    );
  }
}
