import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_booking/model/taxi_booking_details/taxi_booking_details_model.dart';

class TaxiBookingDetailsViewModel extends Cubit<TaxiBookingDetailsModel> {
  TaxiBookingDetailsViewModel() : super(TaxiBookingDetailsModel());
  static TaxiBookingDetailsViewModel get(BuildContext context) => BlocProvider.of<TaxiBookingDetailsViewModel>(context);

  void setPickUpAddress (String address) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: address,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  void setDropOffAddress (String address) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: address,
      date: state.date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  void setDate (DateTime date) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  void setTime (String time) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  void setPaymentMethod (String method) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: state.time,
      paymentMethod: method,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  void setVehicleType (String type) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: type,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  String? getVehicleType () {
    return state.vehicleType;
  }

  void setFullName (String name) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: name,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  void setEmail (String email) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: email,
      phoneNumber: state.phoneNumber,
      roomNumber: state.roomNumber,
    ));
  }

  void setPhoneNumber (String phone) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: phone,
      roomNumber: state.roomNumber,
    ));
  }

  void setRoomNumber (String roomNumber) {
    emit(TaxiBookingDetailsModel(
      pickUpAddress: state.pickUpAddress,
      dropOffAddress: state.dropOffAddress,
      date: state.date,
      time: state.time,
      paymentMethod: state.paymentMethod,
      vehicleType: state.vehicleType,
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      roomNumber: roomNumber,
    ));
  }
}
