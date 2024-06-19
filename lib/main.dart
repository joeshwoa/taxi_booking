import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taxi_booking/services/local_services/local_services.dart';
import 'package:taxi_booking/services/network_services/network_services.dart';
import 'package:taxi_booking/shared/local_storage_manger.dart';
import 'package:taxi_booking/view/screens/all_screens/all_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await LocalStorageManger.init();

  Map<String, dynamic> tokensMap = await NetworkServices.getAccessToken();
  LocalServices.storeAccessToken(tokensMap);

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
      home: const AllScreens(),
    );
  }
}