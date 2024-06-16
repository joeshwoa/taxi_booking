import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';
import 'package:taxi_booking/model/taxi_booking_summary/taxi_booking_summary_model.dart';

class TaxiBookingSummaryViewModel extends Cubit<TaxiBookingSummaryModel> {
  TaxiBookingSummaryViewModel() : super(TaxiBookingSummaryModel());

  static TaxiBookingSummaryViewModel get(BuildContext context) =>
      BlocProvider.of<TaxiBookingSummaryViewModel>(context);

  void setTaxiBookingDetailsModel (TaxiBookingDetailsModel model) {
    emit(TaxiBookingSummaryModel(
      taxiBookingDetailsModel: model,
      totalPrice: state.totalPrice,
      promoCode: state.promoCode,
      discount: state.discount,
      inVoice: state.inVoice,
    ));
  }

  void setPromoCode (String code) {
    emit(TaxiBookingSummaryModel(
      taxiBookingDetailsModel: state.taxiBookingDetailsModel,
      totalPrice: state.totalPrice,
      promoCode: code,
      discount: state.discount,
      inVoice: state.inVoice,
    ));
  }
}