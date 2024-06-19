import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_booking/model/login/login_model.dart';
import 'package:taxi_booking/services/local_services/local_services.dart';
import 'package:taxi_booking/services/network_services/network_services.dart';

class LoginViewModel extends Cubit<LoginModel> {
  LoginViewModel() : super(LoginModel());

  static LoginViewModel get(BuildContext context) =>
      BlocProvider.of<LoginViewModel>(context);

  void setEmail (String email) {
    emit(LoginModel(
      email: email,
      password: state.password,
      rememberUser: state.rememberUser,
    ));
  }

  void setPassword (String password) {
    emit(LoginModel(
      email: state.email,
      password: password,
        rememberUser: state.rememberUser,
    ));
  }

  void setRememberUser (bool rememberUser) {
    emit(LoginModel(
      email: state.email,
      password: state.password,
      rememberUser: rememberUser,
    ));
  }

  Future<bool> login () async {
    Map<String, dynamic> response = await NetworkServices.login(state);

    if(response['access'] != null) {
      LocalServices.storeAccessToken(response);
      if(state.rememberUser??false) {
        LocalServices.rememberUser(state.email!, state.password!);
      }
      return true;
    } else {
      return false;
    }

  }
}