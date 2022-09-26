import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RegisterButton extends StatelessWidget {
  Function() onTap;
  RegisterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xFF6569EB), Color(0xFF6569EB)])),
        child: Text(
          'Register',
          style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 21,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
