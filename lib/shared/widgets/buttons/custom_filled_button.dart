import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String? label;
  final Widget? textWidget;
  final Function() onPressed;
  const CustomFilledButton({
    super.key,
    this.label,
    this.textWidget,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        child: label != null ? Text(label!) : textWidget,
      ),
    );
  }
}
