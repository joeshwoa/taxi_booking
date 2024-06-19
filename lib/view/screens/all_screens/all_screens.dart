import 'package:flutter/material.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/screens/login/login.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_where_when/taxi_booking_details_where_when.dart';
import 'package:taxi_booking/view/screens/taxi_ticket/taxi_ticket.dart';

class AllScreens extends StatelessWidget {
  const AllScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                text: 'Login',
              ),
              GradientButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaxiBookingDetailsWhereWhen(),
                    ),
                  );
                },
                text: 'Booking Taxi',
              ),
              GradientButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaxiTicket(),
                    ),
                  );
                },
                text: 'Ticket',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
