import 'package:flutter/material.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_where_when/taxi_booking_details_where_when.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00817C)),
        useMaterial3: true,
      ),
      home: const TaxiBookingDetailsWhereWhen(),
    );
  }
}
