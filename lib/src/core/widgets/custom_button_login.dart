import 'package:flutter/material.dart';

class CustomButtonLogin extends StatelessWidget {
  const CustomButtonLogin({super.key, this.height = 40, required this.text, required this.onTab});
  final double? height;
  final String text;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTab,
      child: Container(
        height: height,
        width: size.width * 1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.amber),
        child: Center(child: Text(text)),
      ),
    );
  }
}
