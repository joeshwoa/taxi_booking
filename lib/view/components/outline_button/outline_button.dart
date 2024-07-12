import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/shared/colors.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, required this.text, required this.onTap});

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
            color: AppColor.scaffoldBackground,
          border: Border.all(
            color: AppColor.mainColor,
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 56,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: AppColor.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
