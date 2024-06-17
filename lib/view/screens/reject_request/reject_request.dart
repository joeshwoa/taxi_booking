import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/error_button/error_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_where_when/taxi_booking_details_where_when.dart';

class RejectRequest extends StatefulWidget {
  const RejectRequest({super.key});

  @override
  State<RejectRequest> createState() => _RejectRequestState();
}

class _RejectRequestState extends State<RejectRequest> with TickerProviderStateMixin {

  late final GifController controller;

  List<String> reasons = ['Price is Expensive', 'Found More Affordable Price', 'Client Will Take Bus', 'Change of Plans', 'Error', 'Others'];
  String selectReason = 'Price is Expensive';

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
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'Request Rejected',
            style: GoogleFonts.poppins(
              color: AppColor.mainFontColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: AppColor.appBarColor,
          centerTitle: true,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 24, left: 24),
                      child: Gif(
                        image: const AssetImage("assets/gifs/sad_imoji.gif"),
                        controller: controller, // if duration and fps is null, original gif fps will be used.
                        autostart: Autostart.loop,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 24, right: 24),
                      child: Text(
                        'Are you sure you want to cancel request',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: AppColor.mainFontColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 24, right: 24),
                      child: EasyRichText(
                        'you can resume your reservation later via My Booking section',
                        defaultStyle: GoogleFonts.poppins(
                          color: AppColor.secondaryFontColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                        patternList: [
                          EasyRichTextPattern(
                            targetString: 'My Booking',
                            style: GoogleFonts.poppins(
                              color: AppColor.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 4, left: 24, right: 24),
                          child: Text(
                            'Cancelation Reason',
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 24, right: 24),
                          child: DropdownButtonFormField<String>(
                            items: reasons.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.mainColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Found More Affordable Price',
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 16,
                              color: AppColor.secondaryFontColor,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please fill this field';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                selectReason = value??selectReason;
                              });
                            },
                            autofocus: false,
                          ),
                        ),
                      ],
                    ),

                  ],
                )),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: ErrorButton(text: 'yes', onTap: () {
              while(Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TaxiBookingDetailsWhereWhen(),));
            }),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: MainButton(
                text: 'Back',
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
