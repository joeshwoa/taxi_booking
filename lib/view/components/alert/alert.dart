import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';

enum ImageType {
  static,
  gif,
}

class AppAlert extends StatefulWidget {
  const AppAlert({super.key, required this.imagePath, required this.imageType,required this.title, required this.message, required this.buttonText, required this.onTap});
  final String imagePath;
  final ImageType imageType;
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onTap;

  @override
  State<AppAlert> createState() => _AppAlertState();
}

class _AppAlertState extends State<AppAlert> with TickerProviderStateMixin {

  late final GifController controller;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      backgroundColor: AppColor.scaffoldBackground,
      icon: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: AppColor.mainFontColor,
              size: 32,
            ),
          )
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 197,
            width: 197,
            child: Center(
              child: widget.imageType == ImageType.static?Image.asset(widget.imagePath):Gif(
                image: const AssetImage("assets/gifs/sad_imoji.gif"),
                controller: controller, // if duration and fps is null, original gif fps will be used.
                autostart: Autostart.loop,
              ),
            ),
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColor.mainFontColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColor.mainFontColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        GradientButton(text: widget.buttonText, onTap: widget.onTap)
      ],
    );
  }
}


/*
Widget AppAlert(BuildContext context, String imagePath, String title, String message, String buttonText, VoidCallback onTap) {
  return AlertDialog(
    clipBehavior: Clip.antiAlias,
    alignment: Alignment.center,
    backgroundColor: AppColor.scaffoldBackground,

    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 197,
          width: 197,
          child: Center(
            child: Image.asset(imagePath),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: AppColor.mainFontColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: AppColor.mainFontColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
    actions: [
      GradientButton(text: buttonText, onTap: onTap)
    ],
  );
  */
/*CoolAlert.show(
    context: context,
    type: CoolAlertType.custom,
    widget: SizedBox(
      height: 197,
      width: 197,
      child: Center(
        child: Image.asset('assets/images/alert_car.png'),
      ),
    ),
    title: "Taxi Request Sent Successfully",
    titleTextStyle: GoogleFonts.poppins(
      color: AppColor.mainFontColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    text: "We have received your request and will let you know when the driver has reached your pick-up point( Subject to Availability )\nThank you for choosing our service",
    textTextStyle: GoogleFonts.poppins(
      color: AppColor.mainFontColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    showCancelBtn: true,
    backgroundColor: AppColor.scaffoldBackground,

  );*//*

}*/
