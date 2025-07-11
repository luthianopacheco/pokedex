import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? textWidget;
  final bool isFilled;
  final Function() onPressed;
  const CustomButton({
    super.key,
    this.textWidget,
    required this.onPressed,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: isFilled
          ? FilledButton(onPressed: onPressed, child: textWidget)
          : OutlinedButton(onPressed: onPressed, child: textWidget),
    );
  }
}
