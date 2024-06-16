import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/shared/icons.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view_model/taxi_booking_summary/taxi_booking_summary_view_model.dart';

class TaxiBookingSummary extends StatefulWidget {
  const TaxiBookingSummary({super.key,required this.taxiBookingDetailsModel});
  final TaxiBookingDetailsModel taxiBookingDetailsModel;

  @override
  State<TaxiBookingSummary> createState() => _TaxiBookingSummaryState();
}

class _TaxiBookingSummaryState extends State<TaxiBookingSummary> {

  TaxiBookingSummaryViewModel modelView = TaxiBookingSummaryViewModel();

  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        modelView = TaxiBookingSummaryViewModel.get(context);
        modelView.setTaxiBookingDetailsModel(widget.taxiBookingDetailsModel);
        return modelView;
      },
      child: Scaffold(
        backgroundColor: AppColor.scaffoldBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Column(
              children: [
                 Text(
                'Taxi Booking Details',
                  style: GoogleFonts.poppins(
                  color: AppColor.mainFontColor,
                  fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Subject to availability',
                  style: GoogleFonts.poppins(
                    color: AppColor.secondaryFontColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
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
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColor.textFormFieldBackground,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 70,
                                    width: 90,
                                    child: Image.asset('assets/images/${modelView.state.taxiBookingDetailsModel!.vehicleType}.png'),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        modelView.state.taxiBookingDetailsModel!.vehicleType!,
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      RatingBarIndicator(
                                        rating: 2.75,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 14,
                                        direction: Axis.vertical,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Car Price',
                                    style: GoogleFonts.poppins(
                                      color: AppColor.mainFontColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '€325.00',
                                    style: GoogleFonts.poppins(
                                      color: AppColor.mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Booking Details',
                        style: GoogleFonts.poppins(
                          color: AppColor.mainFontColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, left: 24, right:24),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColor.textFormFieldBackground,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                        modelView.state.taxiBookingDetailsModel!.pickUpAddress!,
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                        modelView.state.taxiBookingDetailsModel!.dropOffAddress!,
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
                              Divider(
                                height: 1,
                                color: AppColor.mainColor,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                        DateFormat('dd MMM, yyyy').format(modelView.state.taxiBookingDetailsModel!.date!),
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                        modelView.state.taxiBookingDetailsModel!.time!,
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
                              Divider(
                                height: 1,
                                color: AppColor.mainColor,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Passengers',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.secondaryFontColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if(modelView.state.taxiBookingDetailsModel!.adultsCount!>0)Icon(
                                            AppIcon.man,
                                            color: AppColor.mainFontColor,
                                            size: 16.5,
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.adultsCount!>0)Padding(
                                            padding: const EdgeInsets.only(left: 4, right: 6.0),
                                            child: Text(
                                              modelView.state.taxiBookingDetailsModel!.adultsCount!.toString(),
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainFontColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.childrenCount!>0)Icon(
                                            AppIcon.child,
                                            color: AppColor.mainFontColor,
                                            size: 16.5,
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.childrenCount!>0)Padding(
                                            padding: const EdgeInsets.only(left: 4, right: 6.0),
                                            child: Text(
                                              modelView.state.taxiBookingDetailsModel!.childrenCount!.toString(),
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainFontColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.infantsCount!>0)Icon(
                                            AppIcon.baby,
                                            color: AppColor.mainFontColor,
                                            size: 16.5,
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.infantsCount!>0)Padding(
                                            padding: const EdgeInsets.only(left: 4, right: 6.0),
                                            child: Text(
                                              modelView.state.taxiBookingDetailsModel!.infantsCount!.toString(),
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainFontColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pets',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.secondaryFontColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if(modelView.state.taxiBookingDetailsModel!.dogCount!>0)Icon(
                                            AppIcon.dog,
                                            color: AppColor.mainFontColor,
                                            size: 16.5,
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.dogCount!>0)Padding(
                                            padding: const EdgeInsets.only(left: 4, right: 6.0),
                                            child: Text(
                                              modelView.state.taxiBookingDetailsModel!.dogCount!.toString(),
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainFontColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.catCount!>0)Icon(
                                            AppIcon.cat,
                                            color: AppColor.mainFontColor,
                                            size: 16.5,
                                          ),
                                          if(modelView.state.taxiBookingDetailsModel!.catCount!>0)Padding(
                                            padding: const EdgeInsets.only(left: 4, right: 6.0),
                                            child: Text(
                                              modelView.state.taxiBookingDetailsModel!.catCount!.toString(),
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainFontColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              'Promotional Code',
                              style: GoogleFonts.poppins(
                                color: AppColor.mainFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '(Optional)',
                            style: GoogleFonts.poppins(
                              color: AppColor.secondaryFontColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, left: 24, right:24),
                        child: Container(
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColor.textFormFieldBackground,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              TextFormField(
                                controller: promoCodeController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColor.mainColor,
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                ),
                                onChanged: (value) {
                                  modelView.setPromoCode(value);
                                },
                                autofocus: false,
                                autofillHints: const [],
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                keyboardType: TextInputType.text,
                              ),
                              Container(
                                width: 130,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8),),
                                  color: AppColor.mainColor,
                                ),
                                child: Text(
                                  'Apply',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 24),
              child: GradientButton(
                  text: 'Send Request',
                  onTap: () {

                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: MainButton(
                  text: 'cancel',
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
