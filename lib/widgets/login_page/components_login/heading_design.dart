import 'package:build_fourr/data/models/login_page_models/login_page_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingDesign extends StatelessWidget {
  const HeadingDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double loginTopPosition = 100;
    double loginLeftPosition = 160;
    double fontSizeHeading = 25;
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            loginArrayList[0].designImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: loginTopPosition,
          left: loginLeftPosition,
          child: Text(
            loginArrayList[0].imageHeading,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: fontSizeHeading,
              color: Colors.white,
              letterSpacing: 0.15,
            ),
          ),
        )
      ],
    );
  }
}
