import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';

class ArrivedCarAlert extends StatelessWidget {
  const ArrivedCarAlert({super.key, required this.pickUpAddress, required this.dropOffAddress, required this.date, required this.time});
  final String pickUpAddress;
  final String dropOffAddress;
  final DateTime date;
  final String time;


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
          const SizedBox(
            height: 197,
            width: 197,
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 16, left: 24, right: 24),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColor.boxBorderColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Pick-up',
                              style: GoogleFonts.poppins(
                                color: AppColor.secondaryFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              pickUpAddress,
                              style: GoogleFonts.poppins(
                                color: AppColor.mainFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.35,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Drop-off',
                                style: GoogleFonts.poppins(
                                  color: AppColor.secondaryFontColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                dropOffAddress,
                                style: GoogleFonts.poppins(
                                  color: AppColor.mainFontColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    endIndent: 12,
                    indent: 12,
                    color: AppColor.boxBorderColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: GoogleFonts.poppins(
                                color: AppColor.secondaryFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              DateFormat('dd MMM, yyyy').format(date),
                              style: GoogleFonts.poppins(
                                color: AppColor.mainFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.35,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Time',
                                style: GoogleFonts.poppins(
                                  color: AppColor.secondaryFontColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                time,
                                style: GoogleFonts.poppins(
                                  color: AppColor.mainFontColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Great news! Your Car has been arrived successfully.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColor.mainFontColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Thank you for choosing our services.',
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
        Column(
          children: [
            GradientButton(text: 'Show Ticket', onTap: () {

            }),
            MainButton(text: 'Home page', onTap: () {

            }),
          ],
        )
      ],
    );
  }
}
