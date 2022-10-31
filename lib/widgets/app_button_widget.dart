import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback? onPressed;
  const AppButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 11.5)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: 267.0,
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
