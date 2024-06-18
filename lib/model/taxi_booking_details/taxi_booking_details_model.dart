import 'package:flutter/material.dart';

class TaxiBookingDetailsModel {
  String? pickUpAddress;
  double? pickUpLat;
  double? pickUpLng;
  String? dropOffAddress;
  double? dropOffLat;
  double? dropOffLng;
  DateTime? date;
  TimeOfDay? time;
  String? paymentMethod;
  String? vehicleType;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? roomNumber;
  int? adultsCount;
  int? childrenCount;
  int? infantsCount;
  String? passengerComment;
  int? bigLuggagesCount;
  int? mediumLuggagesCount;
  int? smallLuggagesCount;
  String? luggagesComment;
  int? surfboardCount;
  int? skiCount;
  int? golfCount;
  int? bikeCount;
  String? specialLuggagesComment;
  int? dogCount;
  int? catCount;
  String? petComment;

  TaxiBookingDetailsModel({this.pickUpAddress, this.pickUpLat, this.pickUpLng, this.dropOffAddress, this.dropOffLat, this.dropOffLng, this.date, this.time, this.paymentMethod, this.vehicleType, this.fullName, this.email, this.phoneNumber, this.roomNumber, this.adultsCount, this.childrenCount, this.infantsCount, this.passengerComment, this.bigLuggagesCount, this.mediumLuggagesCount, this.smallLuggagesCount, this.luggagesComment, this.surfboardCount, this.skiCount, this.golfCount, this.bikeCount, this.specialLuggagesComment, this.dogCount, this.catCount, this.petComment});
}