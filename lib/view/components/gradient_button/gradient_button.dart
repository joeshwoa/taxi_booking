import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/shared/colors.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                AppColor.buttonGradientColor1,
                AppColor.buttonGradientColor2,
                AppColor.buttonGradientColor3,
                AppColor.buttonGradientColor4,
                AppColor.buttonGradientColor5,
                AppColor.buttonGradientColor6,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
        ),
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 56,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
