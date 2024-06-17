import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';
import 'package:taxi_booking/model/taxi_booking_summary/taxi_booking_summary_model.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/shared/icons.dart';
import 'package:taxi_booking/view/components/alert/alert.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view/components/summary_bottom_sheet/summary_bottom_sheet.dart';
import 'package:taxi_booking/view/screens/reject_request/reject_request.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_where_when/taxi_booking_details_where_when.dart';
import 'package:taxi_booking/view_model/taxi_booking_summary/taxi_booking_summary_view_model.dart';

class TaxiBookingSummary extends StatefulWidget {
  const TaxiBookingSummary({super.key, required this.taxiBookingDetailsModel});
  final TaxiBookingDetailsModel taxiBookingDetailsModel;

  @override
  State<TaxiBookingSummary> createState() => _TaxiBookingSummaryState();
}

class _TaxiBookingSummaryState extends State<TaxiBookingSummary> {
  late final TaxiBookingSummaryViewModel modelView;

  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        modelView = TaxiBookingSummaryViewModel();
        return modelView;
      },
      child: BlocConsumer<TaxiBookingSummaryViewModel, TaxiBookingSummaryModel>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.scaffoldBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
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
                          fontWeight: FontWeight.w400),
                    )
                  ],
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10,),
                                      child: SizedBox(
                                        height: 70,
                                        width: 90,
                                        child: Transform.flip(
                                          flipX: true,
                                          child: Image.asset(
                                              'assets/images/${widget.taxiBookingDetailsModel.vehicleType}.png'),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          widget.taxiBookingDetailsModel
                                              .vehicleType!,
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainFontColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        RatingBarIndicator(
                                          rating: 2.5,
                                          itemBuilder: (context, index) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 14,
                                          direction: Axis.horizontal,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      '${(modelView.state.totalPrice??0).toString()} €',
                                      style: GoogleFonts.poppins(
                                        color: AppColor.mainColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4, left: 20),
                        child: Text(
                          'Booking Details',
                          style: GoogleFonts.poppins(
                            color: AppColor.mainFontColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                                          widget.taxiBookingDetailsModel
                                              .pickUpAddress!,
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
                                            widget.taxiBookingDetailsModel
                                                .dropOffAddress!,
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
                                          DateFormat('dd MMM, yyyy').format(widget
                                              .taxiBookingDetailsModel.date!),
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
                                            widget.taxiBookingDetailsModel.time!,
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
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 16),
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
                                          'Passengers',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.secondaryFontColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (widget.taxiBookingDetailsModel
                                                .adultsCount != null && widget.taxiBookingDetailsModel
                                                    .adultsCount! >
                                                0)
                                              Icon(
                                                AppIcon.man,
                                                color: AppColor.mainFontColor,
                                                size: 16.5,
                                              ),
                                            if (widget.taxiBookingDetailsModel
                                                .adultsCount != null && widget.taxiBookingDetailsModel
                                                    .adultsCount! >
                                                0)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4, right: 6.0),
                                                child: Text(
                                                  widget.taxiBookingDetailsModel
                                                      .adultsCount!
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                    color: AppColor.mainFontColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            if (widget.taxiBookingDetailsModel
                                                .childrenCount != null && widget.taxiBookingDetailsModel
                                                    .childrenCount! >
                                                0)
                                              Icon(
                                                AppIcon.child,
                                                color: AppColor.mainFontColor,
                                                size: 16.5,
                                              ),
                                            if (widget.taxiBookingDetailsModel
                                                .childrenCount != null && widget.taxiBookingDetailsModel
                                                    .childrenCount! >
                                                0)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4, right: 6.0),
                                                child: Text(
                                                  widget.taxiBookingDetailsModel
                                                      .childrenCount!
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                    color: AppColor.mainFontColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            if (widget.taxiBookingDetailsModel
                                                .infantsCount != null && widget.taxiBookingDetailsModel
                                                    .infantsCount! >
                                                0)
                                              Icon(
                                                AppIcon.baby,
                                                color: AppColor.mainFontColor,
                                                size: 16.5,
                                              ),
                                            if (widget.taxiBookingDetailsModel
                                                .infantsCount != null && widget.taxiBookingDetailsModel
                                                    .infantsCount! >
                                                0)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4, right: 6.0),
                                                child: Text(
                                                  widget.taxiBookingDetailsModel
                                                      .infantsCount!
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                    color: AppColor.mainFontColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            if (!(widget.taxiBookingDetailsModel
                                                .adultsCount != null && widget.taxiBookingDetailsModel
                                                .adultsCount! >
                                                0) && !(widget.taxiBookingDetailsModel
                                                .childrenCount != null && widget.taxiBookingDetailsModel
                                                .childrenCount! >
                                                0) && !(widget.taxiBookingDetailsModel
                                                .infantsCount != null && widget.taxiBookingDetailsModel
                                                .infantsCount! >
                                                0)) Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 6.0),
                                              child: Text(
                                                'Empty',
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
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width*0.35,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (widget.taxiBookingDetailsModel
                                                  .dogCount != null && widget.taxiBookingDetailsModel
                                                      .dogCount! >
                                                  0)
                                                Icon(
                                                  AppIcon.dog,
                                                  color: AppColor.mainFontColor,
                                                  size: 16.5,
                                                ),
                                              if (widget.taxiBookingDetailsModel
                                                  .dogCount != null && widget.taxiBookingDetailsModel
                                                      .dogCount! >
                                                  0)
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 4, right: 6.0),
                                                  child: Text(
                                                    widget.taxiBookingDetailsModel
                                                        .dogCount!
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              if (widget.taxiBookingDetailsModel
                                                  .catCount != null && widget.taxiBookingDetailsModel
                                                      .catCount! >
                                                  0)
                                                Icon(
                                                  AppIcon.cat,
                                                  color: AppColor.mainFontColor,
                                                  size: 16.5,
                                                ),
                                              if (widget.taxiBookingDetailsModel
                                                  .catCount != null && widget.taxiBookingDetailsModel
                                                      .catCount! >
                                                  0)
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 4, right: 6.0),
                                                  child: Text(
                                                    widget.taxiBookingDetailsModel
                                                        .catCount!
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                      color: AppColor.mainFontColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),

                                              if (!(widget.taxiBookingDetailsModel
                                                  .dogCount != null && widget.taxiBookingDetailsModel
                                                  .dogCount! >
                                                  0) && !(widget.taxiBookingDetailsModel
                                                  .catCount != null && widget.taxiBookingDetailsModel
                                                  .catCount! >
                                                  0))
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 4, right: 6.0),
                                                  child: Text(
                                                    'Empty',
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4, left: 20),
                        child: Row(
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
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16, left: 24, right: 24),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColor.boxBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: promoCodeController,
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(width: 0,color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      hintText: 'Enter Promo Code'
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
                                ),
                              ),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {},
                                child: Container(
                                  width: 130,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    color: AppColor.thirdFontColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Apply',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: GoogleFonts.poppins(
                                color: AppColor.secondaryFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '-${(modelView.state.discount??0).toString()} €',
                              style: GoogleFonts.poppins(
                                color: AppColor.secondaryFontColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price',
                              style: GoogleFonts.poppins(
                                color: AppColor.secondaryFontColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${((modelView.state.totalPrice??0)-(modelView.state.discount??0)).toString()} €',
                              style: GoogleFonts.poppins(
                                color: AppColor.mainColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Do you need invoice',
                              style: GoogleFonts.poppins(
                                color: AppColor.secondaryFontColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: false,
                                  groupValue: modelView.state.inVoice??false,
                                  onChanged: (value) {
                                    modelView.setInVoice(value??false);
                                  },
                                ),
                                Text(
                                  'No',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.secondaryFontColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: modelView.state.inVoice??false,
                                  onChanged: (value) {
                                    showBottomSheet();
                                  },
                                ),
                                /*const SizedBox(
                                  width: ,
                                ),*/
                                Text(
                                    'Yes',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.mainFontColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
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
                        imagePath: 'assets/images/alert_car.png',
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
                        imagePath: 'assets/gif/sad_imoji.png',
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
        },
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SummaryBottomSheet(
          onConfirm: (bool individual, String companyName, String gender, String fullName) {
            Navigator.of(context).pop();
            modelView.setIndividual(individual);
            modelView.setCompanyName(companyName);
            modelView.setGender(gender);
            modelView.setFullName(fullName);
            modelView.setInVoice(true);
          },
          onCancel: () {
            Navigator.of(context).pop();
            modelView.setInVoice(false);
          },
        );
      },
    );
  }
}
