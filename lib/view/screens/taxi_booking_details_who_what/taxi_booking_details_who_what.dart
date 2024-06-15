import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view_model/taxi_booking_details/taxi_booking_details_view_model.dart';

class TaxiBookingDetailsWhoWhat extends StatefulWidget {
  const TaxiBookingDetailsWhoWhat({super.key});

  @override
  State<TaxiBookingDetailsWhoWhat> createState() => _TaxiBookingDetailsWhoWhatState();
}

class _TaxiBookingDetailsWhoWhatState extends State<TaxiBookingDetailsWhoWhat> {

  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();

  List<String> vehicleTypes = ['car', 'van'];
  List<String> pages = ['Personal information', 'passengers', 'luggages', 'Special Luggages', 'pets'];
  String page = 'Personal information';

  PhoneCountryData? selectedCountry;
  late List<PhoneCountryData> countryItems;

  TaxiBookingDetailsViewModel modelView = TaxiBookingDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryItems = PhoneCodes.getAllCountryDatas();
    selectedCountry = countryItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        modelView = TaxiBookingDetailsViewModel.get(context);
        return modelView;
      },
      child: Scaffold(
        backgroundColor: AppColor.scaffoldBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Taxi Booking Details'),
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
                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
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
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      for(int i=0; i<vehicleTypes.length; i++)...[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: InkWell(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                modelView.setVehicleType(vehicleTypes[i]);
                                              });
                                            },
                                            child: Container(
                                              height: 80,
                                              width: 179,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: modelView.getVehicleType() == vehicleTypes[i]?AppColor.mainColor:AppColor.mainColor.withOpacity(0),
                                                  width: 1,
                                                )
                                              ),
                                              child: Image.asset('assets/images/${vehicleTypes[i]}.png'),
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
                                for(int i=0; i<pages.length; i++)...[
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
                                      color: AppColor.textFormFieldBackground,
                                      height: 59,
                                      child: page==pages[i]?
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                const Expanded(
                                                  flex: 1,
                                                  child: SizedBox(),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                    child: CustomPaint(
                                                      size: Size(174, (174*0.2558139534883721).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                                      painter: RPSCustomPainter(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                        style: GoogleFonts.poppins(
                                                          color: AppColor.secondaryFontColor,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ):
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.grey,
                                                      fontSize: 12,
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
                                  )
                                ]
                              ],
                            ),
                          ),
                        ),
                        if(page == pages[0])Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
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
                                      color: Colors.black,
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
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: fullNameController,
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
                                    suffixIcon: const Icon(
                                      Icons.mode_edit_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    )
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    modelView.setFullName(value);
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
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: emailController,
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
                                      suffixIcon: const Icon(
                                        Icons.mode_edit_outlined,
                                        size: 20,
                                        color: Colors.black,
                                      )
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    modelView.setEmail(value);
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
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 56,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16),
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
                                            ),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'please fill this field';
                                              }
                                              return null;
                                            },
                                            iconSize: 19,
                                            icon: const Icon(
                                              Icons.arrow_drop_down_rounded,
                                              color: Colors.black,
                                              size: 19,
                                            ),
                                            sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                                            onValuePicked: (Country country) {
                                              setState(() {
                                                selectedCountry = countryItems.firstWhere((element) => element.phoneCode==country.phoneCode,);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: phoneController,
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
                                              suffixIcon: const Icon(
                                                Icons.mode_edit_outlined,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                              hintText: selectedCountry?.phoneMaskWithoutCountryCode,
                                              hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'please fill this field';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            modelView.setPhoneNumber(value);
                                          },
                                          inputFormatters: [
                                            PhoneInputFormatter(
                                              allowEndlessPhone: false,
                                              defaultCountryCode: selectedCountry?.countryCode,
                                            )
                                          ],
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.telephoneNumber],
                                          textInputAction: TextInputAction.next,
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
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: roomNumberController,
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
                                      suffixIcon: const Icon(
                                        Icons.mode_edit_outlined,
                                        size: 20,
                                        color: Colors.black,
                                      )
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    modelView.setRoomNumber(value);
                                  },
                                  autofocus: false,
                                  autofillHints: const [],
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 24),
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
                                      Icons.calendar_month_outlined,
                                      color: AppColor.mainColor,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    'Date & Time',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            FocusScope.of(context).requestFocus(FocusNode()); // Remove focus from the text field
                                            await selectDate(context); // Show the date picker
                                          },
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              controller: dateController,
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
                                                labelText: 'Date',
                                                suffixIcon: const Icon(
                                                  Icons.calendar_month_outlined,
                                                  color: Colors.grey,
                                                  size: 24,
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'please fill this field';
                                                }
                                                return null;
                                              },
                                              autofocus: false,
                                              autofillHints: const [],
                                              textInputAction: TextInputAction.next,
                                              obscureText: false,
                                              keyboardType: TextInputType.datetime,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12),
                                        child: DropdownButtonFormField<String>(
                                          items: times.map<DropdownMenuItem<String>>(
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
                                            labelText: 'Time',
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'please fill this field';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            modelView.setTime(value!);
                                          },
                                          autofocus: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: DropdownButtonFormField<String>(
                                  items: methods.map<DropdownMenuItem<String>>(
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
                                    labelText: 'Payment method',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    modelView.setPaymentMethod(value!);
                                  },
                                  autofocus: false,
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 24),
                child: GradientButton(
                    text: 'Next',
                    onTap: () {
                      if(formKey.currentState!.validate()) {

                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: MainButton(
                    text: 'cancel',
                    onTap: () {}
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Row(
    children: <Widget>[
      Container(
        height: 24,
        width: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle
        ),
        clipBehavior: Clip.antiAlias,
        child: CountryPickerUtils.getDefaultFlagImage(country),
      ),
      /*SizedBox(
        width: 8.0,
      ),
      Text("+${country.phoneCode}(${country.isoCode})"),*/
    ],
  );
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.08675174,size.height*0.3059864);
    path_0.cubicTo(size.width*0.1101570,size.height*0.1187448,size.width*0.1588093,0,size.width*0.2121203,0);
    path_0.lineTo(size.width*0.8047267,0);
    path_0.cubicTo(size.width*0.8621860,0,size.width*0.9137674,size.height*0.1376768,size.width*0.9346860,size.height*0.3468659);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(size.width*0.08675174,size.height*0.3059864);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = AppColor.scaffoldBackground.withOpacity(1.0);
    canvas.drawPath(path_0,paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

