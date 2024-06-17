import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SummaryBottomSheet extends StatefulWidget {
  final Function(bool individual, String companyName, String gender, String fullName) onConfirm;
  final VoidCallback onCancel;

  const SummaryBottomSheet({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  State<SummaryBottomSheet> createState() => _SummaryBottomSheetState();
}

class _SummaryBottomSheetState extends State<SummaryBottomSheet> {

  final formKey = GlobalKey<FormState>();

  bool individual = true;
  List<String> genders = ['MR', 'MS'];
  String selectedGender = 'MR';
  TextEditingController companyNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.scaffoldBackground,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.scaffoldBackground,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppBar(
                      centerTitle: true,
                      backgroundColor: AppColor.scaffoldBackground,
                      foregroundColor: AppColor.scaffoldBackground,
                      shadowColor: AppColor.scaffoldBackground,
                      surfaceTintColor: AppColor.scaffoldBackground,
                      actions: [
                        IconButton(
                          onPressed: widget.onCancel,
                          color: Colors.transparent,
                          icon: Icon(
                            Icons.close,
                            color: AppColor.secondaryFontColor,
                          ),
                        )
                      ],
                      title: Text(
                        'Taxi - Invoice Information',
                        style: GoogleFonts.poppins(
                          color: AppColor.mainFontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Choose invoice type',
                            style: GoogleFonts.poppins(
                              color: AppColor.mainFontColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      individual = true;
                                    });
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColor.mainFontColor,
                                            width: individual?7:1
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Individual',
                                style: GoogleFonts.poppins(
                                  color: AppColor.mainFontColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      individual = false;
                                    });
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColor.mainFontColor,
                                            width: !individual?7:1
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Company',
                                style: GoogleFonts.poppins(
                                  color: AppColor.mainFontColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: companyNameController,
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
                                prefixIcon: Icon(
                                  Icons.work,
                                  size: 16,
                                  color: AppColor.secondaryFontColor,
                                ),
                                hintText: 'Company name'
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please fill this field';
                              }
                              return null;
                            },
                            autofocus: false,
                            autofillHints: const [AutofillHints.name],
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10),
                          child: DropdownButtonFormField<String>(
                            items: genders.map<DropdownMenuItem<String>>(
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
                              hintText: 'MR',
                              prefixIcon: Icon(
                                Icons.person,
                                size: 16,
                                color: AppColor.secondaryFontColor,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please fill this field';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value??'MR';
                              });
                            },
                            autofocus: false,
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
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 16,
                                  color: AppColor.secondaryFontColor,
                                ),
                                hintText: 'Full name'
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please fill this field';
                              }
                              return null;
                            },
                            autofocus: false,
                            autofillHints: const [AutofillHints.name],
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Customer Service ',
                                style: GoogleFonts.poppins(
                                  color: AppColor.mainFontColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () async {
                                  await launchUrl(Uri(scheme: 'tel', path: '01208799962',));
                                },
                                child: Icon(
                                  Icons.phone,
                                  color: AppColor.mainColor,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Total Price',
                                style: GoogleFonts.poppins(
                                  color: AppColor.mainFontColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '680 €',
                                style: GoogleFonts.poppins(
                                  color: AppColor.mainColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    child: GradientButton(
                        text: 'Done',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            widget.onConfirm(individual, companyNameController.text, selectedGender, fullNameController.text);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}