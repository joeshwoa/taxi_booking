import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/shared/icons.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view/screens/taxi_booking_summary/taxi_booking_summary.dart';
import 'package:taxi_booking/view_model/taxi_booking_details/taxi_booking_details_view_model.dart';

class TaxiBookingDetailsWhoWhat extends StatefulWidget {
  const TaxiBookingDetailsWhoWhat({super.key, required this.state});

  final TaxiBookingDetailsModel state;

  @override
  State<TaxiBookingDetailsWhoWhat> createState() =>
      _TaxiBookingDetailsWhoWhatState();
}

class _TaxiBookingDetailsWhoWhatState extends State<TaxiBookingDetailsWhoWhat> {
  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();

  late FocusNode phoneFocusNode;
  bool phoneIsFocused = false;

  List<String> vehicleTypes = ['sedan', 'van'];
  List<String> pages = [
    'Personal information',
    'passengers',
    'luggages',
    'Special Luggages',
    'pets'
  ];
  String page = 'Personal information';

  PhoneCountryData? selectedCountry;
  late List<PhoneCountryData> countryItems;

  int adultsCount = 0;
  int childrenCount = 0;
  int infantsCount = 0;
  TextEditingController passengerCommentController = TextEditingController();

  int bigLuggagesCount = 0;
  int mediumLuggagesCount = 0;
  int smallLuggagesCount = 0;
  TextEditingController luggagesCommentController = TextEditingController();

  int surfboardCount = 0;
  int skiCount = 0;
  int golfCount = 0;
  int bikeCount = 0;
  TextEditingController specialLuggagesCommentController =
      TextEditingController();

  int dogCount = 0;
  int catCount = 0;
  TextEditingController petCommentController = TextEditingController();

  late final TaxiBookingDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    countryItems = PhoneCodes.getAllCountryDatas();
    selectedCountry = countryItems.firstWhere(
      (element) => element.countryCode == 'FR',
    );
    phoneFocusNode = FocusNode();
    phoneFocusNode.addListener(() {
      setState(() {
        phoneIsFocused = phoneFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel = TaxiBookingDetailsViewModel();
        viewModel.setState(widget.state);
        return viewModel;
      },
      child: BlocConsumer<TaxiBookingDetailsViewModel, TaxiBookingDetailsModel>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.scaffoldBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                title: const Text('Taxi Booking Details'),
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
            body: Form(
              key: formKey,
              child: Column(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Select Vehicle type',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.mainFontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      for (int i = 0;
                                          i < vehicleTypes.length;
                                          i++) ...[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                viewModel.setVehicleType(
                                                    vehicleTypes[i]);
                                              });
                                            },
                                            child: Container(
                                              height: 80,
                                              width: 179,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: viewModel
                                                                .state.vehicleType ==
                                                            vehicleTypes[i]
                                                        ? AppColor.mainColor
                                                        : AppColor.mainColor
                                                            .withOpacity(0),
                                                    width: 1,
                                                  )),
                                              child: Image.asset(
                                                  'assets/images/${vehicleTypes[i]}.png'),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                for (int i = 0; i < pages.length; i++) ...[
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        page = pages[i];
                                      });
                                    },
                                    child: Container(
                                      color: AppColor.tabBarColor,
                                      height: 59,
                                      child: page == pages[i]
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Expanded(
                                                        flex: 1,
                                                        child: SizedBox(),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: CustomPaint(
                                                            size: Size(
                                                                174,
                                                                (174 * 0.2558139534883721)
                                                                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                                            painter:
                                                                RPSCustomPainter(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Expanded(
                                                        flex: 1,
                                                        child: SizedBox(),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                          height:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                              pages[i],
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: AppColor
                                                                    .thirdFontColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: SizedBox(),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                          pages[i],
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color: Colors.grey,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ),
                        ),
                        if (page == pages[0])
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.person_outline_outlined,
                                        color: AppColor.mainColor,
                                        size: 32,
                                      ),
                                    ),
                                    Text(
                                      'Who',
                                      style: GoogleFonts.poppins(
                                        color: AppColor.mainFontColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Full Name',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    controller: fullNameController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColor.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        suffixIcon: const Icon(
                                          Icons.mode_edit_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please fill this field';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      viewModel.setFullName(value);
                                    },
                                    autofocus: false,
                                    autofillHints: const [AutofillHints.name],
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                Text(
                                  'Email',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColor.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        suffixIcon: const Icon(
                                          Icons.mode_edit_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please fill this field';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      viewModel.setEmail(value);
                                    },
                                    autofocus: false,
                                    autofillHints: const [AutofillHints.email],
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Text(
                                  'Phone Number',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: SizedBox(
                                    height: 56,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: SizedBox(
                                            width: 81,
                                            child: CountryPickerDropdown(
                                              initialValue: 'FR',
                                              itemBuilder: _buildDropdownItem,
                                              isExpanded: false,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColor.mainColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'please fill this field';
                                                }
                                                return null;
                                              },
                                              iconSize: 19,
                                              icon: const Icon(
                                                AppIcon.arrowDownDrop,
                                                color: Colors.black,
                                                size: 19,
                                              ),
                                              sortComparator:
                                                  (Country a, Country b) => a
                                                      .isoCode
                                                      .compareTo(b.isoCode),
                                              onValuePicked: (Country country) {
                                                setState(() {
                                                  selectedCountry =
                                                      countryItems.firstWhere(
                                                    (element) =>
                                                        element.phoneCode ==
                                                        country.phoneCode,
                                                  );
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            controller: phoneController,
                                            focusNode: phoneFocusNode,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColor.mainColor,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: const Icon(
                                                Icons.mode_edit_outlined,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                              prefixText: phoneIsFocused
                                                  ? '+${selectedCountry?.phoneCode} '
                                                  : '',
                                              hintText: phoneIsFocused
                                                  ? selectedCountry
                                                      ?.phoneMaskWithoutCountryCode
                                                  : '+${selectedCountry?.phoneCode} ${selectedCountry?.phoneMaskWithoutCountryCode}',
                                              hintStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.3)),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'please fill this field';
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              viewModel.setPhoneNumber(
                                                  '+${selectedCountry?.phoneCode}$value');
                                            },
                                            inputFormatters: [
                                              PhoneInputFormatter(
                                                allowEndlessPhone: false,
                                                shouldCorrectNumber: true,
                                                defaultCountryCode:
                                                    selectedCountry
                                                        ?.countryCode,
                                              )
                                            ],
                                            autofocus: false,
                                            autofillHints: const [
                                              AutofillHints.telephoneNumber
                                            ],
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  'Room Number',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    controller: roomNumberController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColor.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        suffixIcon: const Icon(
                                          Icons.mode_edit_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please fill this field';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      viewModel.setRoomNumber(value);
                                    },
                                    autofocus: false,
                                    autofillHints: const [],
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: false, signed: false),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (page == pages[1])
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.man,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Adults',
                                            style: GoogleFonts.poppins(
                                              color: AppColor.mainFontColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Age 13 or above',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  AppColor.secondaryFontColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (adultsCount > 0) {
                                            setState(() {
                                              adultsCount--;
                                            });
                                            viewModel
                                                .setAdultsCount(adultsCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$adultsCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            adultsCount++;
                                          });
                                          viewModel.setAdultsCount(adultsCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.child,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Children',
                                            style: GoogleFonts.poppins(
                                              color: AppColor.mainFontColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Age 2 - 12',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  AppColor.secondaryFontColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (childrenCount > 0) {
                                            setState(() {
                                              childrenCount--;
                                            });
                                            viewModel.setChildrenCount(
                                                childrenCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$childrenCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            childrenCount++;
                                          });
                                          viewModel
                                              .setChildrenCount(childrenCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.baby,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Infants',
                                            style: GoogleFonts.poppins(
                                              color: AppColor.mainFontColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Under 2',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  AppColor.secondaryFontColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (infantsCount > 0) {
                                            setState(() {
                                              infantsCount--;
                                            });
                                            viewModel
                                                .setInfantsCount(infantsCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$infantsCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            infantsCount++;
                                          });
                                          viewModel
                                              .setInfantsCount(infantsCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Comment',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.mainFontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    controller: passengerCommentController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColor.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        hintText:
                                            'Describe any special requests\nEX: Wheel chair , Stroller , ..etc'),
                                    minLines: 3,
                                    maxLines: 10,
                                    onChanged: (value) {
                                      viewModel.setPassengerComment(value);
                                    },
                                    autofocus: false,
                                    autofillHints: const [],
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (page == pages[2])
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.bigLuggage,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Big',
                                            style: GoogleFonts.poppins(
                                              color: AppColor.mainFontColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Rolling Suitcase',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  AppColor.secondaryFontColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (bigLuggagesCount > 0) {
                                            setState(() {
                                              bigLuggagesCount--;
                                            });
                                            viewModel.setBigLuggagesCount(
                                                bigLuggagesCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$bigLuggagesCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            bigLuggagesCount++;
                                          });
                                          viewModel.setBigLuggagesCount(
                                              bigLuggagesCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.mediumLuggage,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Medium',
                                            style: GoogleFonts.poppins(
                                              color: AppColor.mainFontColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Doctor Style & Similar',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  AppColor.secondaryFontColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (mediumLuggagesCount > 0) {
                                            setState(() {
                                              mediumLuggagesCount--;
                                            });
                                            viewModel.setMediumLuggagesCount(
                                                mediumLuggagesCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$mediumLuggagesCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            mediumLuggagesCount++;
                                          });
                                          viewModel.setMediumLuggagesCount(
                                              mediumLuggagesCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.smallLuggage,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Small',
                                            style: GoogleFonts.poppins(
                                              color: AppColor.mainFontColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Backpacks & similar',
                                            style: GoogleFonts.poppins(
                                              color:
                                                  AppColor.secondaryFontColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (smallLuggagesCount > 0) {
                                            setState(() {
                                              smallLuggagesCount--;
                                            });
                                            viewModel.setSmallLuggagesCount(
                                                smallLuggagesCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$smallLuggagesCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            smallLuggagesCount++;
                                          });
                                          viewModel.setSmallLuggagesCount(
                                              smallLuggagesCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Comment',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.mainFontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    controller: luggagesCommentController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColor.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        hintText:
                                            'Describe any special requests\nEX: Wheel chair , Stroller , ..etc'),
                                    minLines: 3,
                                    maxLines: 10,
                                    onChanged: (value) {
                                      viewModel.setLuggagesComment(value);
                                    },
                                    autofocus: false,
                                    autofillHints: const [],
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (page == pages[3])
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.surfboard,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'Surfboard',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (surfboardCount > 0) {
                                            setState(() {
                                              surfboardCount--;
                                            });
                                            viewModel.setSurfboardCount(
                                                surfboardCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$surfboardCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            surfboardCount++;
                                          });
                                          viewModel.setSurfboardCount(
                                              surfboardCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.ski,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'Ski',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (skiCount > 0) {
                                            setState(() {
                                              skiCount--;
                                            });
                                            viewModel.setSkiCount(skiCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$skiCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            skiCount++;
                                          });
                                          viewModel.setSkiCount(skiCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.golf,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'Golf',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (golfCount > 0) {
                                            setState(() {
                                              golfCount--;
                                            });
                                            viewModel.setGolfCount(golfCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$golfCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            golfCount++;
                                          });
                                          viewModel.setGolfCount(golfCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.bike,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'Bike',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (bikeCount > 0) {
                                            setState(() {
                                              bikeCount--;
                                            });
                                            viewModel.setBikeCount(bikeCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$bikeCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            bikeCount++;
                                          });
                                          viewModel.setBikeCount(bikeCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Comment',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.mainFontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    controller:
                                        specialLuggagesCommentController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColor.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        hintText:
                                            'Describe any special requests\nEX: Wheel chair , Stroller , ..etc'),
                                    minLines: 3,
                                    maxLines: 10,
                                    onChanged: (value) {
                                      viewModel
                                          .setSpecialLuggagesComment(value);
                                    },
                                    autofocus: false,
                                    autofillHints: const [],
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (page == pages[4])
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.dog,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'Dogs',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (dogCount > 0) {
                                            setState(() {
                                              dogCount--;
                                            });
                                            viewModel.setDogCount(dogCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$dogCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            dogCount++;
                                          });
                                          viewModel.setDogCount(dogCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          AppIcon.cat,
                                          color: AppColor.mainFontColor,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        'Cats',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.mainFontColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed: () {
                                          if (catCount > 0) {
                                            setState(() {
                                              catCount--;
                                            });
                                            viewModel.setCatCount(catCount);
                                          }
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          '$catCount',
                                          style: GoogleFonts.poppins(
                                            color: AppColor.mainColor,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            catCount++;
                                          });
                                          viewModel.setCatCount(catCount);
                                        },
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.mainColor,
                                                  width: 1)),
                                          child: Center(
                                            child: Text(
                                              '+',
                                              style: GoogleFonts.poppins(
                                                color: AppColor.mainColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Comment',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.mainFontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    controller: petCommentController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColor.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        hintText:
                                            'Describe any special requests\nEX: Wheel chair , Stroller , ..etc'),
                                    minLines: 3,
                                    maxLines: 10,
                                    onChanged: (value) {
                                      viewModel.setPetComment(value);
                                    },
                                    autofocus: false,
                                    autofillHints: const [],
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    child: GradientButton(
                        text: page == pages[0] || page == pages[1]
                            ? 'Next'
                            : 'View Prices',
                        onTap: () {
                          if (formKey.currentState!.validate() &&
                              viewModel.state.vehicleType != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TaxiBookingSummary(
                                    taxiBookingDetailsModel: viewModel.state,
                                  ),
                                ));
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    child: MainButton(
                        text: 'Cancel',
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        height: 24,
        width: 24,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        clipBehavior: Clip.antiAlias,
        child: CountryPickerUtils.getDefaultFlagImage(country),
      );
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.08675174, size.height * 0.3059864);
    path_0.cubicTo(size.width * 0.1101570, size.height * 0.1187448,
        size.width * 0.1588093, 0, size.width * 0.2121203, 0);
    path_0.lineTo(size.width * 0.8047267, 0);
    path_0.cubicTo(
        size.width * 0.8621860,
        0,
        size.width * 0.9137674,
        size.height * 0.1376768,
        size.width * 0.9346860,
        size.height * 0.3468659);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width * 0.08675174, size.height * 0.3059864);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppColor.scaffoldBackground.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
