import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_booking/model/login/login_model.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';
import 'package:taxi_booking/model/taxi_booking_summary/taxi_booking_summary_model.dart';
import 'package:taxi_booking/shared/apis.dart';

class NetworkServices {

  static Future<Map<String, dynamic>> grtTaxiPricesPolicy (TaxiBookingDetailsModel taxiBookingDetailsModel) async {
    http.Response response = await http.get(
      Uri.parse('${APIs.getTaxiPrice}?cats_count=${taxiBookingDetailsModel.catCount??0}&dogs_count=${taxiBookingDetailsModel.dogCount??0}&surfboards_count=${taxiBookingDetailsModel.surfboardCount??0}&skis_count=${taxiBookingDetailsModel.skiCount??0}&golfs_count=${taxiBookingDetailsModel.golfCount??0}&passengers=${(taxiBookingDetailsModel.adultsCount??0) + (taxiBookingDetailsModel.childrenCount??0) + (taxiBookingDetailsModel.infantsCount??0)}&luggages=${(taxiBookingDetailsModel.bigLuggagesCount??0) + (taxiBookingDetailsModel.mediumLuggagesCount??0) + (taxiBookingDetailsModel.smallLuggagesCount??0)}&bikes_count=${taxiBookingDetailsModel.bikeCount??0}&pickupLat=${taxiBookingDetailsModel.pickUpLat}&pickupLng=${taxiBookingDetailsModel.pickUpLng}&dropoffLat=${taxiBookingDetailsModel.dropOffLat}&dropoffLng=${taxiBookingDetailsModel.dropOffLng}&pickupTime=${taxiBookingDetailsModel.date!.add(Duration(hours: taxiBookingDetailsModel.time!.hour, minutes: taxiBookingDetailsModel.time!.minute)).millisecondsSinceEpoch ~/ 1000}&snowboards_count=0'),
    );

    if (response.statusCode >=200 && response.statusCode < 300) {
      Map<String, dynamic> returnMap = jsonDecode(response.body);

      return returnMap;
    } else {
      try {
        Map<String, dynamic> returnMap = jsonDecode(response.body);

        return returnMap;
      } catch (e) {
        return {
          'body': response.body,
        };
      }
    }
  }

  static Future<Map<String, dynamic>> requestTaxi (TaxiBookingDetailsModel taxiBookingDetailsModel, TaxiBookingSummaryModel taxiBookingSummaryModel, String accessToken) async {
    final Map<String, dynamic> map = {};
    map['taxi_type'] = taxiBookingDetailsModel.vehicleType!.toUpperCase();

    map['departure'] = taxiBookingDetailsModel.pickUpAddress;
    map['departure_longitude'] = double.parse(taxiBookingDetailsModel.pickUpLng!.toStringAsFixed(6));
    map['departure_latitude'] = double.parse(taxiBookingDetailsModel.pickUpLat!.toStringAsFixed(6));

    map['arrival'] = taxiBookingDetailsModel.dropOffAddress;
    map['arrival_longitude'] = double.parse(taxiBookingDetailsModel.dropOffLng!.toStringAsFixed(6));
    map['arrival_latitude'] = double.parse(taxiBookingDetailsModel.dropOffLat!.toStringAsFixed(6));

    map['customer_name'] = taxiBookingDetailsModel.fullName;
    map['customer_phone'] = taxiBookingDetailsModel.phoneNumber!.replaceAll(' ', '');
    map['customer_email'] = taxiBookingDetailsModel.email;

    map['customer_room_number'] = taxiBookingDetailsModel.roomNumber;

    map['pickup_time'] = '${taxiBookingDetailsModel.date!.year}-${taxiBookingDetailsModel.date!.month}-${taxiBookingDetailsModel.date!.day} ${taxiBookingDetailsModel.time!.hour}:${taxiBookingDetailsModel.time!.minute}';

    map['adults'] = taxiBookingDetailsModel.adultsCount??0;
    map['children'] = taxiBookingDetailsModel.childrenCount??0;
    map['infants'] = taxiBookingDetailsModel.infantsCount??0;

    map['big_luggage'] = taxiBookingDetailsModel.bigLuggagesCount??0;
    map['medium_luggage'] = taxiBookingDetailsModel.mediumLuggagesCount??0;
    map['small_luggage'] = taxiBookingDetailsModel.smallLuggagesCount??0;

    map['surfboard'] = taxiBookingDetailsModel.surfboardCount??0;
    map['ski'] = taxiBookingDetailsModel.skiCount??0;
    map['golf'] = taxiBookingDetailsModel.golfCount??0;
    map['bike'] = taxiBookingDetailsModel.bikeCount??0;

    map['dogs'] = taxiBookingDetailsModel.dogCount??0;
    map['cats'] = taxiBookingDetailsModel.catCount??0;

    map['note'] = 'Passenger Comment:\n${taxiBookingDetailsModel.passengerComment??'No Comments'}\nLuggages Comment:\n${taxiBookingDetailsModel.luggagesComment??'No Comments'}\nSpecial Luggages Comment:\n${taxiBookingDetailsModel.specialLuggagesComment??'No Comments'}\nPet Comment:\n${taxiBookingDetailsModel.petComment??'No Comments'}';

    map['price'] = taxiBookingSummaryModel.totalPrice;

    if(map['promo_code'] != null) {
      map['promo_code'] = taxiBookingSummaryModel.promoCode;
    }

    map['payment_way'] = taxiBookingDetailsModel.paymentMethod!.toUpperCase().replaceAll(' ', '_');

    var request = http.MultipartRequest('POST', Uri.parse(APIs.requestTaxi));

    request.headers['Authorization'] = "Bearer $accessToken";

    map.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    var streamedResponse = await request.send();

    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >=200 && response.statusCode < 300) {
      Map<String, dynamic> returnMap = jsonDecode(response.body);

      return returnMap;
    } else {
      try {
        Map<String, dynamic> returnMap = jsonDecode(response.body);

        return returnMap;
      } catch (e) {
        return {
          'body': response.body,
        };
      }
    }
  }

  static Future<Map<String, dynamic>> getAccessToken () async {
    final Map<String, dynamic> map = {};

    map['email'] = dotenv.env['TEST_EMAIL'];
    map['password'] = dotenv.env['TEST_PASSWORD'];

    var request = http.MultipartRequest('POST', Uri.parse(APIs.getAccessToken));

    map.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    var streamedResponse = await request.send();

    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >=200 && response.statusCode < 300) {
      Map<String, dynamic> returnMap = jsonDecode(response.body);

      return returnMap;
    } else {
      try {
        Map<String, dynamic> returnMap = jsonDecode(response.body);

        return returnMap;
      } catch (e) {
        return {
          'body': response.body,
        };
      }
    }
  }

  static Future<Map<String, dynamic>> login (LoginModel loginModel) async {
    final Map<String, dynamic> map = {};

    map['email'] = loginModel.email;

    map['password'] = loginModel.password;

    var request = http.MultipartRequest('POST', Uri.parse(APIs.login));

    map.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    var streamedResponse = await request.send();

    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >=200 && response.statusCode < 300) {
      Map<String, dynamic> returnMap = jsonDecode(response.body);

      return returnMap;
    } else {
      try {
        Map<String, dynamic> returnMap = jsonDecode(response.body);

        return returnMap;
      } catch (e) {
        return {
          'body': response.body,
        };
      }
    }
  }

}