import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_where_when/taxi_booking_details_where_when.dart';
import 'package:taxi_booking/view/screens/taxi_ticket/taxi_ticket.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

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
      home: const TaxiBookingDetailsWhereWhen()/*TaxiTicket()*/,
    );
  }
}