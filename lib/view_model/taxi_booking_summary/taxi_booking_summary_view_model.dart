import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';
import 'package:taxi_booking/model/taxi_booking_summary/taxi_booking_summary_model.dart';
import 'package:taxi_booking/services/local_services/local_services.dart';
import 'package:taxi_booking/services/network_services/network_services.dart';

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

  Future<void> updatePrice (TaxiBookingDetailsModel taxiBookingDetailsModel) async {
    Map<String, dynamic> pricesPolicy = await NetworkServices.grtTaxiPricesPolicy(taxiBookingDetailsModel);
    int price = LocalServices.calculateTaxiPrice(taxiBookingDetailsModel, pricesPolicy);

    emit(TaxiBookingSummaryModel(
      totalPrice: price,
      promoCode: state.promoCode,
      discount: state.discount,
      inVoice: state.inVoice,
      individual: state.individual,
      companyName: state.companyName,
      gender: state.gender,
      fullName: state.fullName,
    ));
  }

  Future<bool> requestTaxi (TaxiBookingDetailsModel taxiBookingDetailsModel) async {
    String accessToken = LocalServices.getAccessToken();
    Map<String, dynamic> returnMap = await NetworkServices.requestTaxi(taxiBookingDetailsModel, state, accessToken);
    if(returnMap['id'] != null) {
      return true;
    } else {
      return false;
    }
  }
}