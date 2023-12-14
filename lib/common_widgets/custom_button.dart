import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonLabel;
  final Color buttonColor;
  final VoidCallback callback;

  const CustomButton(
      {super.key,
      required this.buttonLabel,
      required this.buttonColor,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          buttonLabel,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
