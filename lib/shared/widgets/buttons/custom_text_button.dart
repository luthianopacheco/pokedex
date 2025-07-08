import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: TextButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
