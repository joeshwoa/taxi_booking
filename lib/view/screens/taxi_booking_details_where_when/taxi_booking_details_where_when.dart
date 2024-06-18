import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_who_what/taxi_booking_details_who_what.dart';
import 'package:taxi_booking/view_model/taxi_booking_details/taxi_booking_details_view_model.dart';

class TaxiBookingDetailsWhereWhen extends StatefulWidget {
  const TaxiBookingDetailsWhereWhen({super.key});

  @override
  State<TaxiBookingDetailsWhereWhen> createState() =>
      _TaxiBookingDetailsWhereWhenState();
}

class _TaxiBookingDetailsWhereWhenState
    extends State<TaxiBookingDetailsWhereWhen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  List<String> methods = ['Cash', 'Credit online'];

  late final TaxiBookingDetailsViewModel modelView;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = pickedDate
            .toIso8601String()
            .split('T')
            .first; // Update the text field
        modelView.setDate(pickedDate); // Update the model view
      });
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        timeController.text = pickedTime
            .toString()
            .split('(')[1]
            .split(')')[0]; // Update the text field
        modelView.setTime(pickedTime); // Update the model view
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        modelView = TaxiBookingDetailsViewModel();
        return modelView;
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          AppColor.textFormFieldBackground,
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: AppColor.mainColor,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Where',
                                    style: GoogleFonts.poppins(
                                      color: AppColor.mainFontColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 10),
                                child: GooglePlaceAutoCompleteTextField(
                                  showError: true,
                                  boxDecoration: const BoxDecoration(),
                                  textEditingController: pickUpController,
                                  googleAPIKey: "AIzaSyDAqZY75SGfTJgzPNZJ_JAQSn_RrS4WWFE",
                                  inputDecoration: InputDecoration(
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
                                    prefixIconConstraints: const BoxConstraints(maxWidth: 44),
                                    prefixIcon: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(width: 15),
                                        CircleAvatar(
                                          backgroundColor: AppColor.mainColor,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: AppColor.scaffoldBackground,
                                            radius: 6,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                      ],
                                    ),
                                    filled: true,
                                    fillColor: AppColor.textFormFieldBackground,
                                    labelText: 'Pick-up address',
                                  ),
                                  debounceTime: 800,
                                  countries: const ["fr"],
                                  isLatLngRequired: true,
                                  getPlaceDetailWithLatLng: (Prediction prediction) async {
                                    modelView.setPickUpAddress(prediction.description??'', double.parse(prediction.lat ?? "0",), double.parse(prediction.lng ?? "0",));
                                  },
                                  itemClick: (Prediction prediction) {
                                    pickUpController.text = prediction.description.toString();
                                    pickUpController.selection = TextSelection.fromPosition(
                                        TextPosition(offset: prediction.description!.length));
                                    modelView.setPickUpAddress(prediction.description??'', double.parse(prediction.lat ?? "0",), double.parse(prediction.lng ?? "0",));
                                  },
                                  itemBuilder: (context, index, Prediction prediction) {
                                    if (prediction.types!.contains("country")) {
                                      return const SizedBox();
                                    }
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.star_border, color: Colors.grey),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Expanded(child: Text(prediction.description ?? ""))
                                        ],
                                      ),
                                    );
                                  },
                                  seperatedBuilder: const Divider(),
                                  isCrossBtnShown: true,
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 10),
                                child: GooglePlaceAutoCompleteTextField(
                                  showError: true,
                                  boxDecoration: const BoxDecoration(),
                                  textEditingController: dropOffController,
                                  googleAPIKey: "AIzaSyDAqZY75SGfTJgzPNZJ_JAQSn_RrS4WWFE",
                                  inputDecoration: InputDecoration(
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
                                    prefixIconConstraints: const BoxConstraints(maxWidth: 44),
                                    prefixIcon: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(width: 15),
                                        CircleAvatar(
                                          backgroundColor: AppColor.mainColor,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: AppColor.scaffoldBackground,
                                            radius: 6,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                      ],
                                    ),
                                    filled: true,
                                    fillColor: AppColor.textFormFieldBackground,
                                    labelText: 'Drop-off address',
                                  ),
                                  debounceTime: 800,
                                  countries: const ["fr"],
                                  isLatLngRequired: true,
                                  getPlaceDetailWithLatLng: (Prediction prediction) async {
                                    modelView.setDropOffAddress(prediction.description??'', double.parse(prediction.lat ?? "0",), double.parse(prediction.lng ?? "0",));
                                  },
                                  itemClick: (Prediction prediction) {
                                    dropOffController.text = prediction.description.toString();
                                    dropOffController.selection = TextSelection.fromPosition(
                                        TextPosition(offset: prediction.description!.length));
                                    modelView.setDropOffAddress(prediction.description??'', double.parse(prediction.lat ?? "0",), double.parse(prediction.lng ?? "0",));
                                  },
                                  itemBuilder: (context, index, Prediction prediction) {
                                    if (prediction.types!.contains("country")) {
                                      return const SizedBox();
                                    }
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.star_border, color: Colors.grey),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Expanded(child: Text(prediction.description ?? ""))
                                        ],
                                      ),
                                    );
                                  },
                                  seperatedBuilder: const Divider(),
                                  isCrossBtnShown: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 24),
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
                                    child: CircleAvatar(
                                      backgroundColor:
                                          AppColor.textFormFieldBackground,
                                      child: Icon(
                                        Icons.calendar_month_outlined,
                                        color: AppColor.mainColor,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Date & Time',
                                    style: GoogleFonts.poppins(
                                      color: AppColor.mainFontColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            FocusScope.of(context).requestFocus(
                                                FocusNode()); // Remove focus from the text field
                                            await selectDate(
                                                context); // Show the date picker
                                          },
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              controller: dateController,
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
                                                labelText: 'Date',
                                                suffixIcon: const Icon(
                                                  Icons.calendar_month_outlined,
                                                  color: Colors.grey,
                                                  size: 24,
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'please fill this field';
                                                }
                                                return null;
                                              },
                                              autofocus: false,
                                              autofillHints: const [],
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              keyboardType:
                                                  TextInputType.datetime,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            FocusScope.of(context).requestFocus(
                                                FocusNode()); // Remove focus from the text field
                                            await selectTime(
                                                context); // Show the date picker
                                          },
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              controller: timeController,
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
                                                labelText: 'Time',
                                                suffixIcon: const Icon(
                                                  Icons.watch_later_outlined,
                                                  color: Colors.grey,
                                                  size: 24,
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'please fill this field';
                                                }
                                                return null;
                                              },
                                              autofocus: false,
                                              autofillHints: const [],
                                              textInputAction:
                                              TextInputAction.next,
                                              obscureText: false,
                                              keyboardType:
                                              TextInputType.datetime,
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
                                    const EdgeInsets.symmetric(vertical: 10),
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
                        ),
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    child: GradientButton(
                        text: 'Next',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TaxiBookingDetailsWhoWhat(
                                    state: modelView.state,
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
}
