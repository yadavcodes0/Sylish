import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({super.key, required this.imagePath, required this.onTap});

  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFFf83758),
          ),
          color: const Color(0xfffcf3f5),
        ),
      ),
    );
  }
}
