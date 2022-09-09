import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  Function() onTap;
  LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xFF6569EB), Color(0xFF6569EB)])),
        child: Text(
          'Login',
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
