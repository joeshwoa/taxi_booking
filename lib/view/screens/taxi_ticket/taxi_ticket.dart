import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/generated/assets.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/alert/alert.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view/screens/reject_request/reject_request.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_where_when/taxi_booking_details_where_when.dart';

class TaxiTicket extends StatefulWidget {
  const TaxiTicket({super.key,});

  @override
  State<TaxiTicket> createState() => _TaxiTicketState();
}

class _TaxiTicketState extends State<TaxiTicket> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'Taxi Service',
            style: GoogleFonts.poppins(
              color: AppColor.mainFontColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: AppColor.appBarColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: Center(
                        child: Text(
                          'Taxi Service',
                          style: GoogleFonts.poppins(
                            color: AppColor.mainFontColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4, left: 20),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299).toDouble(),
                            width: MediaQuery.sizeOf(context).width*0.9,//You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            child: SvgPicture.asset(
                                Assets.imagesTicket,
                                semanticsLabel: 'Ticket Image'
                            ),
                          ),
                          SizedBox(
                            height: (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299).toDouble(),
                            width: MediaQuery.sizeOf(context).width*0.9,//You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299)*0.11,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Hotel Name',
                                            style: GoogleFonts.poppins(
                                              color: AppColor.mainFontColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 47,
                                            height: 45,
                                            child: Image.asset(Assets.imagesMainLogo),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299)*0.51,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Pick Up',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    '12:00',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    '4 October 2024',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                  'assets/images/arrow.svg',
                                                  semanticsLabel: 'Arrow Image'
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Drop Off',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    '4 October 2024',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Name',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Eslam Mohamed',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.sizeOf(context).width*0.9*0.22,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Passengers',
                                                      style: GoogleFonts.poppins(
                                                        color: AppColor.mainFontColor,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      '4',
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Email',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    'example@gmail.com',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.sizeOf(context).width*0.9*0.22,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Passengers',
                                                      style: GoogleFonts.poppins(
                                                        color: AppColor.mainFontColor,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      '4',
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Room Number',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    '1925',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.sizeOf(context).width*0.9*0.22,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Luggages',
                                                      style: GoogleFonts.poppins(
                                                        color: AppColor.mainFontColor,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      '4',
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Special Luggages',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    '1',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.sizeOf(context).width*0.9*0.22,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Pets',
                                                      style: GoogleFonts.poppins(
                                                        color: AppColor.mainFontColor,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      '1',
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299)*0.07,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299)*0.31,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Total Price',
                                                style: GoogleFonts.poppins(
                                                  color: AppColor.secondaryFontColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '85,00 €',
                                                style: GoogleFonts.poppins(
                                                  color: AppColor.mainFontColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          BarcodeWidget(
                                            height: (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299)*0.2,
                                            barcode: Barcode.isbn(),
                                            data: '9781119550822',
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: GradientButton(text: 'Send Request', onTap: () {
              Random random = Random();
              if (random.nextBool()) {
                showDialog(context: context, builder: (context) => AppAlert(
                  imagePath: Assets.imagesAlertCar,
                  imageType: ImageType.static,
                  title: 'Taxi Request Sent Successfully',
                  message: 'We have received your request and will let you know when the driver has reached your pick-up point( Subject to Availability )\nThank you for choosing our service',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Call us +33 6 44 9 1 53 10',
                ));
              } else {
                showDialog(context: context, builder: (context) => AppAlert(
                  imagePath: Assets.gifsSadImoji,
                  imageType: ImageType.gif,
                  title: 'No car available now',
                  message: 'We regret to inform you that there are currently no vehicles available for the requested itinerary. Please book your next transfer in advance.',
                  onTap: () {
                    while(Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TaxiBookingDetailsWhereWhen(),));
                  },
                  buttonText: 'Home Page',
                ));
              }
            }),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: MainButton(
                text: 'Reject',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RejectRequest(),));
                }),
          ),
        ],
      ),
    );
  }
}


