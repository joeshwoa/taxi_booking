import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/generated/assets.dart';
import 'package:taxi_booking/model/login/login_model.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/toast/toast.dart';
import 'package:taxi_booking/view_model/login/login_view_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visionPassword = false;

  late final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel = LoginViewModel();
        return viewModel;
      },
      child: BlocConsumer<LoginViewModel, LoginModel>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.scaffoldBackground,
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
                            padding: const EdgeInsets.only(left: 24, right: 24, top: 64, bottom: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8,),
                                  child: SizedBox(
                                    height: 56,
                                    width: 58,
                                    child: Image.asset(Assets.imagesMainLogo),
                                  ),
                                ),
                                EasyRichText(
                                  'Welcome To KIRO TRAVEL VTC TAXI\nLogin To Continue',
                                  defaultStyle: GoogleFonts.poppins(
                                    color: AppColor.secondaryFontColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.start,
                                  patternList: [
                                    EasyRichTextPattern(
                                      targetString: 'KIRO TRAVEL VTC TAXI',
                                      style: GoogleFonts.poppins(
                                        color: AppColor.mainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.mainColor,
                                      ),
                                    ),
                                    EasyRichTextPattern(
                                      targetString: 'Login',
                                      style: GoogleFonts.poppins(
                                        color: AppColor.mainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.mainColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 6),
                            child: Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24),
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
                              ),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 6, top: 24),
                            child: Text(
                              'Password',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24),
                            child: TextFormField(
                              controller: passwordController,
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
                                  suffixIcon: InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        visionPassword = !visionPassword;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                              ),
                              obscureText: !visionPassword,
                              enableSuggestions: visionPassword,
                              autocorrect: visionPassword,
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
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      onChanged: (value) {
                                        viewModel.setRememberUser(value!);
                                      },
                                      value: viewModel.state.rememberUser??false,
                                      activeColor: AppColor.mainColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0,),
                                      child: Text(
                                        'Remember Me',
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {},
                                  child: Text(
                                    'Forget your password?',
                                    style: GoogleFonts.poppins(
                                      color: AppColor.mainColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      textStyle: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.mainColor
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 48),
                            child: GradientButton(
                              onTap: () async {
                                bool userLogin = await viewModel.login();
                                if (userLogin) {
                                  // go to home page
                                } else {
                                  // get all possible errors to set specific message for each one
                                  showToast("Can't Login");
                                }
                              },
                              text: 'Login',
                            ),
                          ),
                          Center(
                            child: EasyRichText(
                              'Don’t have an account? Sign up',
                              defaultStyle: GoogleFonts.poppins(
                                color: AppColor.secondaryFontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                              patternList: [
                                EasyRichTextPattern(
                                  targetString: 'Sign up',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.mainColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    decorationColor: AppColor.mainColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
