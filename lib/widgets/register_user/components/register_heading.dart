import 'package:build_fourr/data/models/login_page_models/login_page_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterHeadingDesign extends StatelessWidget {
  const RegisterHeadingDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double registerTopPosition = 100;
    double registerLeftPosition = 160;
    double fontSizeHeading = 25;
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            registerArrayList[0].designImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: registerTopPosition,
          left: registerLeftPosition,
          child: Text(
            registerArrayList[0].imageHeading,
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
