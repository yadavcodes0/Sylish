import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixiconPath,
    required this.validator,
    this.suffixiconPath,
    required this.isPasswordField,
    this.controller,
  });

  final String hintText;
  final String prefixiconPath;
  final String? suffixiconPath;
  final String? Function(String?)? validator;
  final bool isPasswordField;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPasswordField ? !showPassword : false,
      cursorColor: const Color(0xFFF83758),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            strokeAlign: BorderSide.strokeAlignOutside,
            style: BorderStyle.solid,
            color: Color(0xFFF83758),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 243, 243),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.montserrat(
          color: const Color(0xFF676767),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: SvgPicture.asset(
          widget.prefixiconPath,
          fit: BoxFit.none,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            strokeAlign: BorderSide.strokeAlignOutside,
            style: BorderStyle.solid,
            color: Color(0xFFA8A8A9),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: widget.isPasswordField
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: showPassword
                    ? SvgPicture.asset(
                        widget.suffixiconPath!,
                        fit: BoxFit.none,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Color(0xff626262),
                      ),
              )
            : null,
      ),
    );
  }
}
