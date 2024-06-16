import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';

class TaxiBookingSummaryModel {
  TaxiBookingDetailsModel? taxiBookingDetailsModel;
  int? totalPrice;
  String? promoCode;
  int? discount;
  bool? inVoice;

  TaxiBookingSummaryModel({this.taxiBookingDetailsModel, this.totalPrice, this.discount, this.inVoice, this.promoCode});
}