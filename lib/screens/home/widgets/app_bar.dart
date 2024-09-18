import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF2F2F2),
          ),
          child: SvgPicture.asset(
            "assets/icons/menu.svg",
            fit: BoxFit.none,
          ),
        ),

        // logo
        SizedBox(
          height: 40,
          child: SvgPicture.asset("assets/icons/logo.svg"),
        ),

        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/user.jpg"),
        ),
      ],
    );
  }
}
