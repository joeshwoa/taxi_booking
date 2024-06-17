import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_booking/model/taxi_booking_summary/taxi_booking_summary_model.dart';

class TaxiBookingSummaryViewModel extends Cubit<TaxiBookingSummaryModel> {
  TaxiBookingSummaryViewModel() : super(TaxiBookingSummaryModel());

  static TaxiBookingSummaryViewModel get(BuildContext context) =>
      BlocProvider.of<TaxiBookingSummaryViewModel>(context);

  void setPromoCode (String code) {
    emit(TaxiBookingSummaryModel(
      totalPrice: state.totalPrice,
      promoCode: code,
      discount: state.discount,
      inVoice: state.inVoice,
      individual: state.individual,
      companyName: state.companyName,
      gender: state.gender,
      fullName: state.fullName,
    ));
  }

  void setInVoice (bool inVoice) {
    emit(TaxiBookingSummaryModel(
      totalPrice: state.totalPrice,
      promoCode: state.promoCode,
      discount: state.discount,
      inVoice: inVoice,
      individual: state.individual,
      companyName: state.companyName,
      gender: state.gender,
      fullName: state.fullName,
    ));
  }

  void setIndividual (bool individual) {
    emit(TaxiBookingSummaryModel(
      totalPrice: state.totalPrice,
      promoCode: state.promoCode,
      discount: state.discount,
      inVoice: state.inVoice,
      individual: individual,
      companyName: state.companyName,
      gender: state.gender,
      fullName: state.fullName,
    ));
  }

  void setCompanyName (String companyName) {
    emit(TaxiBookingSummaryModel(
      totalPrice: state.totalPrice,
      promoCode: state.promoCode,
      discount: state.discount,
      inVoice: state.inVoice,
      individual: state.individual,
      companyName: companyName,
      gender: state.gender,
      fullName: state.fullName,
    ));
  }

  void setGender (String gender) {
    emit(TaxiBookingSummaryModel(
      totalPrice: state.totalPrice,
      promoCode: state.promoCode,
      discount: state.discount,
      inVoice: state.inVoice,
      individual: state.individual,
      companyName: state.companyName,
      gender: state.gender,
      fullName: state.fullName,
    ));
  }

  void setFullName (String fullName) {
    emit(TaxiBookingSummaryModel(
      totalPrice: state.totalPrice,
      promoCode: state.promoCode,
      discount: state.discount,
      inVoice: state.inVoice,
      individual: state.individual,
      companyName: state.companyName,
      gender: state.gender,
      fullName: fullName,
    ));
  }
}