import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';

class LocalServices {

  static int calculateTaxiPrice (TaxiBookingDetailsModel taxiBookingDetailsModel, Map<String, dynamic> pricesPolicy) {
    double price = pricesPolicy['base_fare']*1.0;

    if(taxiBookingDetailsModel.vehicleType == 'van') {
      if ( (taxiBookingDetailsModel.adultsCount??0) + (taxiBookingDetailsModel.childrenCount??0) + (taxiBookingDetailsModel.infantsCount??0) <= 4 ) {
        price += pricesPolicy['fare_data']['van4Passengers'];
      } else if ( (taxiBookingDetailsModel.adultsCount??0) + (taxiBookingDetailsModel.childrenCount??0) + (taxiBookingDetailsModel.infantsCount??0) == 5 ) {
        price += pricesPolicy['fare_data']['van5Passengers'];
      } else if ( (taxiBookingDetailsModel.adultsCount??0) + (taxiBookingDetailsModel.childrenCount??0) + (taxiBookingDetailsModel.infantsCount??0) == 6 ) {
        price += pricesPolicy['fare_data']['van6Passengers'];
      } else if ( (taxiBookingDetailsModel.adultsCount??0) + (taxiBookingDetailsModel.childrenCount??0) + (taxiBookingDetailsModel.infantsCount??0) == 7 ) {
        price += pricesPolicy['fare_data']['van7Passengers'];
      } else if ( (taxiBookingDetailsModel.adultsCount??0) + (taxiBookingDetailsModel.childrenCount??0) + (taxiBookingDetailsModel.infantsCount??0) >= 8 ) {
        price += pricesPolicy['fare_data']['van8Passengers'];
      }
    } else {
      price += pricesPolicy['fare_data']['sedan'];
    }

    return price.round();
  }

}