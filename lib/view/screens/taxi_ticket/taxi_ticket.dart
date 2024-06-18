import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_booking/shared/colors.dart';
import 'package:taxi_booking/view/components/alert/alert.dart';
import 'package:taxi_booking/view/components/gradient_button/gradient_button.dart';
import 'package:taxi_booking/view/components/main_button/main_button.dart';
import 'package:taxi_booking/view/screens/reject_request/reject_request.dart';
import 'package:taxi_booking/view/screens/taxi_booking_details_where_when/taxi_booking_details_where_when.dart';

class TaxiTicket extends StatefulWidget {
  const TaxiTicket({super.key,});

  @override
  State<TaxiTicket> createState() => _TaxiTicketState();
}

class _TaxiTicketState extends State<TaxiTicket> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Text(
            'Taxi Service',
            style: GoogleFonts.poppins(
              color: AppColor.mainFontColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: AppColor.appBarColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: Center(
                        child: Text(
                          'Taxi Service',
                          style: GoogleFonts.poppins(
                            color: AppColor.mainFontColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4, left: 20),
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(MediaQuery.sizeOf(context).width*0.9, (MediaQuery.sizeOf(context).width*0.9*1.8115183246073299).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter(),
                          ),

                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: GradientButton(text: 'Send Request', onTap: () {
              Random random = Random();
              if (random.nextBool()) {
                showDialog(context: context, builder: (context) => AppAlert(
                  imagePath: 'assets/images/alert_car.png',
                  imageType: ImageType.static,
                  title: 'Taxi Request Sent Successfully',
                  message: 'We have received your request and will let you know when the driver has reached your pick-up point( Subject to Availability )\nThank you for choosing our service',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Call us +33 6 44 9 1 53 10',
                ));
              } else {
                showDialog(context: context, builder: (context) => AppAlert(
                  imagePath: 'assets/gif/sad_imoji.png',
                  imageType: ImageType.gif,
                  title: 'No car available now',
                  message: 'We regret to inform you that there are currently no vehicles available for the requested itinerary. Please book your next transfer in advance.',
                  onTap: () {
                    while(Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TaxiBookingDetailsWhereWhen(),));
                  },
                  buttonText: 'Home Page',
                ));
              }
            }),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: MainButton(
                text: 'Reject',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RejectRequest(),));
                }),
          ),
        ],
      ),
    );
  }
}


class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double NaN = -9223372036854775808;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.004339660, size.height * 0.09838627);
    path_0.cubicTo(
        size.width * 0.001490257,
        size.height * 0.1005142,
        size.width * -0.000002810471,
        size.height * 0.1029052,
        size.width * -0.006259162,
        size.height * -0.007225434);
    path_0.cubicTo(size.width * 0.1908173, size.height * NaN, size.width * NaN,
        size.height * NaN, size.width * NaN, size.height * NaN);
    path_0.lineTo(size.width * -0.02246958, size.height * -0.008670520);
    path_0.lineTo(size.width * 1.113207, size.height * NaN);
    path_0.cubicTo(
        size.width * 0.00001389340,
        size.height * 0.6174971,
        size.width * 0.002280254,
        size.height * 0.6204003,
        size.width * 0.006484215,
        size.height * 0.6228251);
    path_0.cubicTo(
        size.width * 0.01068814,
        size.height * 0.6252514,
        size.width * 0.01662092,
        size.height * 0.6270766,
        size.width * 0.02345819,
        size.height * 0.6280477);
    path_0.cubicTo(
        size.width * 0.03742173,
        size.height * 0.6300491,
        size.width * 0.04952644,
        size.height * 0.6337919,
        size.width * 0.05809267,
        size.height * 0.6387572);
    path_0.cubicTo(
        size.width * 0.06665890,
        size.height * 0.6437211,
        size.width * 0.07126126,
        size.height * 0.6496618,
        size.width * 0.07126126,
        size.height * 0.6557543);
    path_0.cubicTo(
        size.width * 0.07126126,
        size.height * 0.6618454,
        size.width * 0.06665890,
        size.height * 0.6677861,
        size.width * 0.05809267,
        size.height * 0.6727500);
    path_0.cubicTo(
        size.width * 0.04952644,
        size.height * 0.6777153,
        size.width * 0.03742173,
        size.height * 0.6814581,
        size.width * 0.02345819,
        size.height * 0.6834595);
    path_0.cubicTo(
        size.width * 0.01662094,
        size.height * 0.6844321,
        size.width * 0.01068817,
        size.height * 0.6862572,
        size.width * 0.006484215,
        size.height * 0.6886821);
    path_0.cubicTo(
        size.width * 0.002280259,
        size.height * 0.6911069,
        size.width * 0.00001389942,
        size.height * 0.6940116,
        size.width * -0.01597081,
        size.height * -0.008670520);
    path_0.cubicTo(size.width * 1.262613, size.height * NaN, size.width * NaN,
        size.height * NaN, size.width * NaN, size.height * NaN);
    path_0.lineTo(size.width * 0.006774424, size.height * -0.008670520);
    path_0.lineTo(size.width * 1.785518, size.height * NaN);
    path_0.cubicTo(
        size.width * -0.000003074974,
        size.height * 0.9875318,
        size.width * 0.0008949791,
        size.height * 0.9893974,
        size.width * 0.002643063,
        size.height * 0.9911387);
    path_0.cubicTo(
        size.width * 0.004391152,
        size.height * 0.9928801,
        size.width * 0.006954895,
        size.height * 0.9944624,
        size.width * 0.01018780,
        size.height * 0.9957948);
    path_0.cubicTo(
        size.width * 0.01342071,
        size.height * 0.9971286,
        size.width * 0.01725940,
        size.height * 0.9981864,
        size.width * 0.02148450,
        size.height * 0.9989075);
    path_0.cubicTo(
        size.width * 0.02570963,
        size.height * 0.9996286,
        size.width * 0.03023848,
        size.height,
        size.width * 0.03481204,
        size.height);
    path_0.lineTo(size.width * 0.9651885, size.height);
    path_0.cubicTo(
        size.width * 0.9697618,
        size.height,
        size.width * 0.9742906,
        size.height * 0.9996286,
        size.width * 0.9785157,
        size.height * 0.9989075);
    path_0.cubicTo(
        size.width * 0.9827408,
        size.height * 0.9981864,
        size.width * 0.9865785,
        size.height * 0.9971286,
        size.width * 0.9898115,
        size.height * 0.9957948);
    path_0.cubicTo(
        size.width * 0.9930445,
        size.height * 0.9944624,
        size.width * 0.9956099,
        size.height * 0.9928801,
        size.width * 0.9973560,
        size.height * 0.9911387);
    path_0.cubicTo(
        size.width * 0.9991047,
        size.height * 0.9893974,
        size.width * 1.000003,
        size.height * 0.9875318,
        size.width,
        size.height * 0.9856474);
    path_0.lineTo(size.width, size.height * 0.6970390);
    path_0.cubicTo(
        size.width * 0.9999869,
        size.height * 0.6940592,
        size.width * 0.9977199,
        size.height * 0.6911546,
        size.width * 0.9935157,
        size.height * 0.6887298);
    path_0.cubicTo(
        size.width * 0.9893115,
        size.height * 0.6863049,
        size.width * 0.9833796,
        size.height * 0.6844798,
        size.width * 0.9765419,
        size.height * 0.6835072);
    path_0.cubicTo(
        size.width * 0.9625785,
        size.height * 0.6815058,
        size.width * 0.9504738,
        size.height * 0.6777630,
        size.width * 0.9419084,
        size.height * 0.6727991);
    path_0.cubicTo(
        size.width * 0.9333403,
        size.height * 0.6678338,
        size.width * 0.9287382,
        size.height * 0.6618931,
        size.width * 0.9287382,
        size.height * 0.6558020);
    path_0.cubicTo(
        size.width * 0.9287382,
        size.height * 0.6497110,
        size.width * 0.9333403,
        size.height * 0.6437702,
        size.width * 0.9419084,
        size.height * 0.6388049);
    path_0.cubicTo(
        size.width * 0.9504738,
        size.height * 0.6338410,
        size.width * 0.9625785,
        size.height * 0.6300983,
        size.width * 0.9765419,
        size.height * 0.6280968);
    path_0.cubicTo(
        size.width * 0.9833796,
        size.height * 0.6271243,
        size.width * 0.9893115,
        size.height * 0.6252991,
        size.width * 0.9935157,
        size.height * 0.6228743);
    path_0.cubicTo(
        size.width * 0.9977199,
        size.height * 0.6204494,
        size.width * 0.9999869,
        size.height * 0.6175448,
        size.width,
        size.height * 0.6145650);
    path_0.lineTo(size.width, size.height * 0.1053838);
    path_0.cubicTo(
        size.width * 1.000003,
        size.height * 0.1034999,
        size.width * 0.9991047,
        size.height * 0.1016342,
        size.width * 0.9973560,
        size.height * 0.09989335);
    path_0.cubicTo(
        size.width * 0.9956073,
        size.height * 0.09815260,
        size.width * 0.9930445,
        size.height * 0.09657095,
        size.width * 0.9898115,
        size.height * 0.09523887);
    path_0.cubicTo(
        size.width * 0.9865785,
        size.height * 0.09390665,
        size.width * 0.9827382,
        size.height * 0.09285014,
        size.width * 0.9785131,
        size.height * 0.09212977);
    path_0.cubicTo(
        size.width * 0.9742880,
        size.height * 0.09140939,
        size.width * 0.9697592,
        size.height * 0.09103916,
        size.width * 0.9651885,
        size.height * 0.09104046);
    path_0.lineTo(size.width * 0.03481178, size.height * 0.09104061);
    path_0.cubicTo(
        size.width * 0.02860497,
        size.height * 0.09103540,
        size.width * 0.02250741,
        size.height * 0.09171358,
        size.width * 0.01715003,
        size.height * 0.09300491);
    path_0.cubicTo(
        size.width * 0.01179264,
        size.height * 0.09429639,
        size.width * 0.007369974,
        size.height * 0.09615434,
        size.width * 0.004339660,
        size.height * 0.09838627);
    path_0.close();
    path_0.moveTo(size.width * 0.8837408, size.height * 0.6533425);
    path_0.cubicTo(
        size.width * 0.8849215,
        size.height * 0.6533367,
        size.width * 0.8860759,
        size.height * 0.6534769,
        size.width * 0.8870602,
        size.height * 0.6537457);
    path_0.cubicTo(
        size.width * 0.8880445,
        size.height * 0.6540130,
        size.width * 0.8888141,
        size.height * 0.6543960,
        size.width * 0.8892644,
        size.height * 0.6548454);
    path_0.cubicTo(
        size.width * 0.8897173,
        size.height * 0.6552948,
        size.width * 0.8898325,
        size.height * 0.6557890,
        size.width * 0.8895942,
        size.height * 0.6562645);
    path_0.cubicTo(
        size.width * 0.8893586,
        size.height * 0.6567413,
        size.width * 0.8887827,
        size.height * 0.6571777,
        size.width * 0.8879398,
        size.height * 0.6575173);
    path_0.cubicTo(
        size.width * 0.8868168,
        size.height * 0.6579697,
        size.width * 0.8853089,
        size.height * 0.6582225,
        size.width * 0.8837408,
        size.height * 0.6582225);
    path_0.lineTo(size.width * 0.8148665, size.height * 0.6582225);
    path_0.cubicTo(
        size.width * 0.8136911,
        size.height * 0.6582254,
        size.width * 0.8125393,
        size.height * 0.6580838,
        size.width * 0.8115602,
        size.height * 0.6578165);
    path_0.cubicTo(
        size.width * 0.8105785,
        size.height * 0.6575477,
        size.width * 0.8098141,
        size.height * 0.6571662,
        size.width * 0.8093613,
        size.height * 0.6567182);
    path_0.cubicTo(
        size.width * 0.8089084,
        size.height * 0.6562702,
        size.width * 0.8087880,
        size.height * 0.6557775,
        size.width * 0.8090183,
        size.height * 0.6553020);
    path_0.cubicTo(
        size.width * 0.8092461,
        size.height * 0.6548266,
        size.width * 0.8098115,
        size.height * 0.6543902,
        size.width * 0.8106440,
        size.height * 0.6540477);
    path_0.cubicTo(
        size.width * 0.8117749,
        size.height * 0.6535939,
        size.width * 0.8132906,
        size.height * 0.6533410,
        size.width * 0.8148665,
        size.height * 0.6533425);
    path_0.lineTo(size.width * 0.8837408, size.height * 0.6533425);
    path_0.close();
    path_0.moveTo(size.width * 0.7657461, size.height * 0.6533425);
    path_0.cubicTo(
        size.width * 0.7669215,
        size.height * 0.6533396,
        size.width * 0.7680733,
        size.height * 0.6534812,
        size.width * 0.7690550,
        size.height * 0.6537500);
    path_0.cubicTo(
        size.width * 0.7700366,
        size.height * 0.6540173,
        size.width * 0.7708010,
        size.height * 0.6543988,
        size.width * 0.7712539,
        size.height * 0.6548468);
    path_0.cubicTo(
        size.width * 0.7717042,
        size.height * 0.6552948,
        size.width * 0.7718246,
        size.height * 0.6557876,
        size.width * 0.7715969,
        size.height * 0.6562630);
    path_0.cubicTo(
        size.width * 0.7713665,
        size.height * 0.6567384,
        size.width * 0.7708010,
        size.height * 0.6571749,
        size.width * 0.7699686,
        size.height * 0.6575173);
    path_0.cubicTo(
        size.width * 0.7688377,
        size.height * 0.6579697,
        size.width * 0.7673220,
        size.height * 0.6582225,
        size.width * 0.7657461,
        size.height * 0.6582225);
    path_0.lineTo(size.width * 0.6968717, size.height * 0.6582225);
    path_0.cubicTo(
        size.width * 0.6956963,
        size.height * 0.6582254,
        size.width * 0.6945445,
        size.height * 0.6580838,
        size.width * 0.6935654,
        size.height * 0.6578165);
    path_0.cubicTo(
        size.width * 0.6925838,
        size.height * 0.6575477,
        size.width * 0.6918194,
        size.height * 0.6571662,
        size.width * 0.6913665,
        size.height * 0.6567182);
    path_0.cubicTo(
        size.width * 0.6909136,
        size.height * 0.6562702,
        size.width * 0.6907932,
        size.height * 0.6557775,
        size.width * 0.6910236,
        size.height * 0.6553020);
    path_0.cubicTo(
        size.width * 0.6912513,
        size.height * 0.6548266,
        size.width * 0.6918194,
        size.height * 0.6543902,
        size.width * 0.6926518,
        size.height * 0.6540477);
    path_0.cubicTo(
        size.width * 0.6937801,
        size.height * 0.6535939,
        size.width * 0.6952958,
        size.height * 0.6533410,
        size.width * 0.6968717,
        size.height * 0.6533425);
    path_0.lineTo(size.width * 0.7657461, size.height * 0.6533425);
    path_0.close();
    path_0.moveTo(size.width * 0.6477513, size.height * 0.6533425);
    path_0.cubicTo(
        size.width * 0.6485602,
        size.height * 0.6533208,
        size.width * 0.6493717,
        size.height * 0.6533685,
        size.width * 0.6501335,
        size.height * 0.6534812);
    path_0.cubicTo(
        size.width * 0.6508979,
        size.height * 0.6535954,
        size.width * 0.6515969,
        size.height * 0.6537717,
        size.width * 0.6521859,
        size.height * 0.6540000);
    path_0.cubicTo(
        size.width * 0.6527775,
        size.height * 0.6542283,
        size.width * 0.6532487,
        size.height * 0.6545043,
        size.width * 0.6535707,
        size.height * 0.6548121);
    path_0.cubicTo(
        size.width * 0.6538927,
        size.height * 0.6551185,
        size.width * 0.6540602,
        size.height * 0.6554480,
        size.width * 0.6540602,
        size.height * 0.6557832);
    path_0.cubicTo(
        size.width * 0.6540602,
        size.height * 0.6561171,
        size.width * 0.6538927,
        size.height * 0.6564480,
        size.width * 0.6535707,
        size.height * 0.6567543);
    path_0.cubicTo(
        size.width * 0.6532487,
        size.height * 0.6570607,
        size.width * 0.6527775,
        size.height * 0.6573367,
        size.width * 0.6521859,
        size.height * 0.6575650);
    path_0.cubicTo(
        size.width * 0.6515969,
        size.height * 0.6577934,
        size.width * 0.6508979,
        size.height * 0.6579697,
        size.width * 0.6501335,
        size.height * 0.6580838);
    path_0.cubicTo(
        size.width * 0.6493717,
        size.height * 0.6581965,
        size.width * 0.6485602,
        size.height * 0.6582442,
        size.width * 0.6477513,
        size.height * 0.6582225);
    path_0.lineTo(size.width * 0.5787853, size.height * 0.6582225);
    path_0.cubicTo(
        size.width * 0.5776126,
        size.height * 0.6582211,
        size.width * 0.5764686,
        size.height * 0.6580766,
        size.width * 0.5754948,
        size.height * 0.6578078);
    path_0.cubicTo(
        size.width * 0.5745209,
        size.height * 0.6575390,
        size.width * 0.5737618,
        size.height * 0.6571575,
        size.width * 0.5733115,
        size.height * 0.6567124);
    path_0.cubicTo(
        size.width * 0.5728613,
        size.height * 0.6562673,
        size.width * 0.5727408,
        size.height * 0.6557760,
        size.width * 0.5729634,
        size.height * 0.6553020);
    path_0.cubicTo(
        size.width * 0.5731832,
        size.height * 0.6548280,
        size.width * 0.5737408,
        size.height * 0.6543916,
        size.width * 0.5745628,
        size.height * 0.6540477);
    path_0.cubicTo(
        size.width * 0.5756911,
        size.height * 0.6535939,
        size.width * 0.5772068,
        size.height * 0.6533410,
        size.width * 0.5787853,
        size.height * 0.6533425);
    path_0.lineTo(size.width * 0.6477513, size.height * 0.6533425);
    path_0.close();
    path_0.moveTo(size.width * 0.5297801, size.height * 0.6533425);
    path_0.cubicTo(
        size.width * 0.5305890,
        size.height * 0.6533208,
        size.width * 0.5314005,
        size.height * 0.6533685,
        size.width * 0.5321623,
        size.height * 0.6534812);
    path_0.cubicTo(
        size.width * 0.5329267,
        size.height * 0.6535954,
        size.width * 0.5336257,
        size.height * 0.6537717,
        size.width * 0.5342147,
        size.height * 0.6540000);
    path_0.cubicTo(
        size.width * 0.5348063,
        size.height * 0.6542283,
        size.width * 0.5352775,
        size.height * 0.6545043,
        size.width * 0.5355995,
        size.height * 0.6548121);
    path_0.cubicTo(
        size.width * 0.5359215,
        size.height * 0.6551185,
        size.width * 0.5360890,
        size.height * 0.6554480,
        size.width * 0.5360890,
        size.height * 0.6557832);
    path_0.cubicTo(
        size.width * 0.5360890,
        size.height * 0.6561171,
        size.width * 0.5359215,
        size.height * 0.6564480,
        size.width * 0.5355995,
        size.height * 0.6567543);
    path_0.cubicTo(
        size.width * 0.5352775,
        size.height * 0.6570607,
        size.width * 0.5348063,
        size.height * 0.6573367,
        size.width * 0.5342147,
        size.height * 0.6575650);
    path_0.cubicTo(
        size.width * 0.5336257,
        size.height * 0.6577934,
        size.width * 0.5329267,
        size.height * 0.6579697,
        size.width * 0.5321623,
        size.height * 0.6580838);
    path_0.cubicTo(
        size.width * 0.5314005,
        size.height * 0.6581965,
        size.width * 0.5305890,
        size.height * 0.6582442,
        size.width * 0.5297801,
        size.height * 0.6582225);
    path_0.lineTo(size.width * 0.4608586, size.height * 0.6582225);
    path_0.cubicTo(
        size.width * 0.4596911,
        size.height * 0.6582197,
        size.width * 0.4585497,
        size.height * 0.6580737,
        size.width * 0.4575812,
        size.height * 0.6578035);
    path_0.cubicTo(
        size.width * 0.4566099,
        size.height * 0.6575347,
        size.width * 0.4558534,
        size.height * 0.6571532,
        size.width * 0.4554058,
        size.height * 0.6567081);
    path_0.cubicTo(
        size.width * 0.4549581,
        size.height * 0.6562630,
        size.width * 0.4548403,
        size.height * 0.6557731,
        size.width * 0.4550628,
        size.height * 0.6553006);
    path_0.cubicTo(
        size.width * 0.4552853,
        size.height * 0.6548266,
        size.width * 0.4558403,
        size.height * 0.6543916,
        size.width * 0.4566597,
        size.height * 0.6540477);
    path_0.cubicTo(
        size.width * 0.4577853,
        size.height * 0.6535968,
        size.width * 0.4592906,
        size.height * 0.6533439,
        size.width * 0.4608586,
        size.height * 0.6533425);
    path_0.lineTo(size.width * 0.5297801, size.height * 0.6533425);
    path_0.close();
    path_0.moveTo(size.width * 0.4117853, size.height * 0.6533425);
    path_0.cubicTo(
        size.width * 0.4125628,
        size.height * 0.6533410,
        size.width * 0.4133351,
        size.height * 0.6534032,
        size.width * 0.4140550,
        size.height * 0.6535246);
    path_0.cubicTo(
        size.width * 0.4147749,
        size.height * 0.6536460,
        size.width * 0.4154293,
        size.height * 0.6538251,
        size.width * 0.4159817,
        size.height * 0.6540520);
    path_0.cubicTo(
        size.width * 0.4165314,
        size.height * 0.6542789,
        size.width * 0.4169686,
        size.height * 0.6545477,
        size.width * 0.4172670,
        size.height * 0.6548439);
    path_0.cubicTo(
        size.width * 0.4175654,
        size.height * 0.6551402,
        size.width * 0.4177199,
        size.height * 0.6554566,
        size.width * 0.4177199,
        size.height * 0.6557775);
    path_0.cubicTo(
        size.width * 0.4177251,
        size.height * 0.6564277,
        size.width * 0.4171099,
        size.height * 0.6570520,
        size.width * 0.4160079,
        size.height * 0.6575173);
    path_0.cubicTo(
        size.width * 0.4148717,
        size.height * 0.6579682,
        size.width * 0.4133613,
        size.height * 0.6582211,
        size.width * 0.4117853,
        size.height * 0.6582225);
    path_0.lineTo(size.width * 0.3429110, size.height * 0.6582225);
    path_0.cubicTo(
        size.width * 0.3417356,
        size.height * 0.6582254,
        size.width * 0.3405838,
        size.height * 0.6580838,
        size.width * 0.3396021,
        size.height * 0.6578165);
    path_0.cubicTo(
        size.width * 0.3386230,
        size.height * 0.6575477,
        size.width * 0.3378586,
        size.height * 0.6571662,
        size.width * 0.3374058,
        size.height * 0.6567182);
    path_0.cubicTo(
        size.width * 0.3369529,
        size.height * 0.6562702,
        size.width * 0.3368325,
        size.height * 0.6557775,
        size.width * 0.3370628,
        size.height * 0.6553020);
    path_0.cubicTo(
        size.width * 0.3372906,
        size.height * 0.6548266,
        size.width * 0.3378560,
        size.height * 0.6543902,
        size.width * 0.3386885,
        size.height * 0.6540477);
    path_0.cubicTo(
        size.width * 0.3398168,
        size.height * 0.6535925,
        size.width * 0.3413351,
        size.height * 0.6533396,
        size.width * 0.3429110,
        size.height * 0.6533425);
    path_0.lineTo(size.width * 0.4117853, size.height * 0.6533425);
    path_0.close();
    path_0.moveTo(size.width * 0.2937906, size.height * 0.6533425);
    path_0.cubicTo(
        size.width * 0.2949712,
        size.height * 0.6533367,
        size.width * 0.2961257,
        size.height * 0.6534769,
        size.width * 0.2971099,
        size.height * 0.6537457);
    path_0.cubicTo(
        size.width * 0.2980942,
        size.height * 0.6540130,
        size.width * 0.2988613,
        size.height * 0.6543960,
        size.width * 0.2993141,
        size.height * 0.6548454);
    path_0.cubicTo(
        size.width * 0.2997644,
        size.height * 0.6552948,
        size.width * 0.2998796,
        size.height * 0.6557890,
        size.width * 0.2996440,
        size.height * 0.6562645);
    path_0.cubicTo(
        size.width * 0.2994084,
        size.height * 0.6567413,
        size.width * 0.2988325,
        size.height * 0.6571777,
        size.width * 0.2979895,
        size.height * 0.6575173);
    path_0.cubicTo(
        size.width * 0.2968665,
        size.height * 0.6579697,
        size.width * 0.2953586,
        size.height * 0.6582225,
        size.width * 0.2937906,
        size.height * 0.6582225);
    path_0.lineTo(size.width * 0.2249173, size.height * 0.6582225);
    path_0.cubicTo(
        size.width * 0.2237408,
        size.height * 0.6582254,
        size.width * 0.2225890,
        size.height * 0.6580838,
        size.width * 0.2216086,
        size.height * 0.6578165);
    path_0.cubicTo(
        size.width * 0.2206280,
        size.height * 0.6575477,
        size.width * 0.2198631,
        size.height * 0.6571662,
        size.width * 0.2194105,
        size.height * 0.6567182);
    path_0.cubicTo(
        size.width * 0.2189581,
        size.height * 0.6562702,
        size.width * 0.2188385,
        size.height * 0.6557775,
        size.width * 0.2190673,
        size.height * 0.6553020);
    path_0.cubicTo(
        size.width * 0.2192958,
        size.height * 0.6548266,
        size.width * 0.2198623,
        size.height * 0.6543902,
        size.width * 0.2206948,
        size.height * 0.6540477);
    path_0.cubicTo(
        size.width * 0.2218241,
        size.height * 0.6535939,
        size.width * 0.2233401,
        size.height * 0.6533410,
        size.width * 0.2249173,
        size.height * 0.6533425);
    path_0.lineTo(size.width * 0.2937906, size.height * 0.6533425);
    path_0.close();
    path_0.moveTo(size.width * 0.1757958, size.height * 0.6533425);
    path_0.cubicTo(
        size.width * 0.1765751,
        size.height * 0.6533410,
        size.width * 0.1773474,
        size.height * 0.6534032,
        size.width * 0.1780688,
        size.height * 0.6535246);
    path_0.cubicTo(
        size.width * 0.1787901,
        size.height * 0.6536460,
        size.width * 0.1794458,
        size.height * 0.6538251,
        size.width * 0.1799992,
        size.height * 0.6540520);
    path_0.cubicTo(
        size.width * 0.1805526,
        size.height * 0.6542775,
        size.width * 0.1809924,
        size.height * 0.6545462,
        size.width * 0.1812935,
        size.height * 0.6548425);
    path_0.cubicTo(
        size.width * 0.1815945,
        size.height * 0.6551387,
        size.width * 0.1817510,
        size.height * 0.6554566,
        size.width * 0.1817542,
        size.height * 0.6557775);
    path_0.cubicTo(
        size.width * 0.1817605,
        size.height * 0.6561012,
        size.width * 0.1816105,
        size.height * 0.6564205,
        size.width * 0.1813131,
        size.height * 0.6567197);
    path_0.cubicTo(
        size.width * 0.1810154,
        size.height * 0.6570173,
        size.width * 0.1805764,
        size.height * 0.6572890,
        size.width * 0.1800215,
        size.height * 0.6575159);
    path_0.cubicTo(
        size.width * 0.1794668,
        size.height * 0.6577442,
        size.width * 0.1788071,
        size.height * 0.6579234,
        size.width * 0.1780814,
        size.height * 0.6580448);
    path_0.cubicTo(
        size.width * 0.1773558,
        size.height * 0.6581662,
        size.width * 0.1765788,
        size.height * 0.6582269,
        size.width * 0.1757958,
        size.height * 0.6582225);
    path_0.lineTo(size.width * 0.1069225, size.height * 0.6582225);
    path_0.cubicTo(
        size.width * 0.1061131,
        size.height * 0.6582442,
        size.width * 0.1053021,
        size.height * 0.6581965,
        size.width * 0.1045393,
        size.height * 0.6580838);
    path_0.cubicTo(
        size.width * 0.1037764,
        size.height * 0.6579697,
        size.width * 0.1030780,
        size.height * 0.6577934,
        size.width * 0.1024869,
        size.height * 0.6575650);
    path_0.cubicTo(
        size.width * 0.1018958,
        size.height * 0.6573367,
        size.width * 0.1014249,
        size.height * 0.6570607,
        size.width * 0.1011029,
        size.height * 0.6567543);
    path_0.cubicTo(
        size.width * 0.1007809,
        size.height * 0.6564480,
        size.width * 0.1006147,
        size.height * 0.6561171,
        size.width * 0.1006147,
        size.height * 0.6557832);
    path_0.cubicTo(
        size.width * 0.1006147,
        size.height * 0.6554480,
        size.width * 0.1007809,
        size.height * 0.6551185,
        size.width * 0.1011029,
        size.height * 0.6548121);
    path_0.cubicTo(
        size.width * 0.1014249,
        size.height * 0.6545043,
        size.width * 0.1018958,
        size.height * 0.6542283,
        size.width * 0.1024869,
        size.height * 0.6540000);
    path_0.cubicTo(
        size.width * 0.1030780,
        size.height * 0.6537717,
        size.width * 0.1037764,
        size.height * 0.6535954,
        size.width * 0.1045393,
        size.height * 0.6534812);
    path_0.cubicTo(
        size.width * 0.1053021,
        size.height * 0.6533685,
        size.width * 0.1061131,
        size.height * 0.6533208,
        size.width * 0.1069225,
        size.height * 0.6533425);
    path_0.lineTo(size.width * 0.1757958, size.height * 0.6533425);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.004339660, size.height * 0.09838627);
    path_1.cubicTo(
        size.width * 0.001490257,
        size.height * 0.1005142,
        size.width * -0.000002810471,
        size.height * 0.1029052,
        size.width * -0.006259162,
        size.height * -0.007225434);
    path_1.cubicTo(size.width * 0.1908173, size.height * NaN, size.width * NaN,
        size.height * NaN, size.width * NaN, size.height * NaN);
    path_1.lineTo(size.width * -0.02246958, size.height * -0.008670520);
    path_1.lineTo(size.width * 1.113207, size.height * NaN);
    path_1.cubicTo(
        size.width * 0.00001389340,
        size.height * 0.6174971,
        size.width * 0.002280254,
        size.height * 0.6204003,
        size.width * 0.006484215,
        size.height * 0.6228251);
    path_1.cubicTo(
        size.width * 0.01068814,
        size.height * 0.6252514,
        size.width * 0.01662092,
        size.height * 0.6270766,
        size.width * 0.02345819,
        size.height * 0.6280477);
    path_1.cubicTo(
        size.width * 0.03742173,
        size.height * 0.6300491,
        size.width * 0.04952644,
        size.height * 0.6337919,
        size.width * 0.05809267,
        size.height * 0.6387572);
    path_1.cubicTo(
        size.width * 0.06665890,
        size.height * 0.6437211,
        size.width * 0.07126126,
        size.height * 0.6496618,
        size.width * 0.07126126,
        size.height * 0.6557543);
    path_1.cubicTo(
        size.width * 0.07126126,
        size.height * 0.6618454,
        size.width * 0.06665890,
        size.height * 0.6677861,
        size.width * 0.05809267,
        size.height * 0.6727500);
    path_1.cubicTo(
        size.width * 0.04952644,
        size.height * 0.6777153,
        size.width * 0.03742173,
        size.height * 0.6814581,
        size.width * 0.02345819,
        size.height * 0.6834595);
    path_1.cubicTo(
        size.width * 0.01662094,
        size.height * 0.6844321,
        size.width * 0.01068817,
        size.height * 0.6862572,
        size.width * 0.006484215,
        size.height * 0.6886821);
    path_1.cubicTo(
        size.width * 0.002280259,
        size.height * 0.6911069,
        size.width * 0.00001389942,
        size.height * 0.6940116,
        size.width * -0.01597081,
        size.height * -0.008670520);
    path_1.cubicTo(size.width * 1.262613, size.height * NaN, size.width * NaN,
        size.height * NaN, size.width * NaN, size.height * NaN);
    path_1.lineTo(size.width * 0.006774424, size.height * -0.008670520);
    path_1.lineTo(size.width * 1.785518, size.height * NaN);
    path_1.cubicTo(
        size.width * -0.000003074974,
        size.height * 0.9875318,
        size.width * 0.0008949791,
        size.height * 0.9893974,
        size.width * 0.002643063,
        size.height * 0.9911387);
    path_1.cubicTo(
        size.width * 0.004391152,
        size.height * 0.9928801,
        size.width * 0.006954895,
        size.height * 0.9944624,
        size.width * 0.01018780,
        size.height * 0.9957948);
    path_1.cubicTo(
        size.width * 0.01342071,
        size.height * 0.9971286,
        size.width * 0.01725940,
        size.height * 0.9981864,
        size.width * 0.02148450,
        size.height * 0.9989075);
    path_1.cubicTo(
        size.width * 0.02570963,
        size.height * 0.9996286,
        size.width * 0.03023848,
        size.height,
        size.width * 0.03481204,
        size.height);
    path_1.lineTo(size.width * 0.9651885, size.height);
    path_1.cubicTo(
        size.width * 0.9697618,
        size.height,
        size.width * 0.9742906,
        size.height * 0.9996286,
        size.width * 0.9785157,
        size.height * 0.9989075);
    path_1.cubicTo(
        size.width * 0.9827408,
        size.height * 0.9981864,
        size.width * 0.9865785,
        size.height * 0.9971286,
        size.width * 0.9898115,
        size.height * 0.9957948);
    path_1.cubicTo(
        size.width * 0.9930445,
        size.height * 0.9944624,
        size.width * 0.9956099,
        size.height * 0.9928801,
        size.width * 0.9973560,
        size.height * 0.9911387);
    path_1.cubicTo(
        size.width * 0.9991047,
        size.height * 0.9893974,
        size.width * 1.000003,
        size.height * 0.9875318,
        size.width,
        size.height * 0.9856474);
    path_1.lineTo(size.width, size.height * 0.6970390);
    path_1.cubicTo(
        size.width * 0.9999869,
        size.height * 0.6940592,
        size.width * 0.9977199,
        size.height * 0.6911546,
        size.width * 0.9935157,
        size.height * 0.6887298);
    path_1.cubicTo(
        size.width * 0.9893115,
        size.height * 0.6863049,
        size.width * 0.9833796,
        size.height * 0.6844798,
        size.width * 0.9765419,
        size.height * 0.6835072);
    path_1.cubicTo(
        size.width * 0.9625785,
        size.height * 0.6815058,
        size.width * 0.9504738,
        size.height * 0.6777630,
        size.width * 0.9419084,
        size.height * 0.6727991);
    path_1.cubicTo(
        size.width * 0.9333403,
        size.height * 0.6678338,
        size.width * 0.9287382,
        size.height * 0.6618931,
        size.width * 0.9287382,
        size.height * 0.6558020);
    path_1.cubicTo(
        size.width * 0.9287382,
        size.height * 0.6497110,
        size.width * 0.9333403,
        size.height * 0.6437702,
        size.width * 0.9419084,
        size.height * 0.6388049);
    path_1.cubicTo(
        size.width * 0.9504738,
        size.height * 0.6338410,
        size.width * 0.9625785,
        size.height * 0.6300983,
        size.width * 0.9765419,
        size.height * 0.6280968);
    path_1.cubicTo(
        size.width * 0.9833796,
        size.height * 0.6271243,
        size.width * 0.9893115,
        size.height * 0.6252991,
        size.width * 0.9935157,
        size.height * 0.6228743);
    path_1.cubicTo(
        size.width * 0.9977199,
        size.height * 0.6204494,
        size.width * 0.9999869,
        size.height * 0.6175448,
        size.width,
        size.height * 0.6145650);
    path_1.lineTo(size.width, size.height * 0.1053838);
    path_1.cubicTo(
        size.width * 1.000003,
        size.height * 0.1034999,
        size.width * 0.9991047,
        size.height * 0.1016342,
        size.width * 0.9973560,
        size.height * 0.09989335);
    path_1.cubicTo(
        size.width * 0.9956073,
        size.height * 0.09815260,
        size.width * 0.9930445,
        size.height * 0.09657095,
        size.width * 0.9898115,
        size.height * 0.09523887);
    path_1.cubicTo(
        size.width * 0.9865785,
        size.height * 0.09390665,
        size.width * 0.9827382,
        size.height * 0.09285014,
        size.width * 0.9785131,
        size.height * 0.09212977);
    path_1.cubicTo(
        size.width * 0.9742880,
        size.height * 0.09140939,
        size.width * 0.9697592,
        size.height * 0.09103916,
        size.width * 0.9651885,
        size.height * 0.09104046);
    path_1.lineTo(size.width * 0.03481178, size.height * 0.09104061);
    path_1.cubicTo(
        size.width * 0.02860497,
        size.height * 0.09103540,
        size.width * 0.02250741,
        size.height * 0.09171358,
        size.width * 0.01715003,
        size.height * 0.09300491);
    path_1.cubicTo(
        size.width * 0.01179264,
        size.height * 0.09429639,
        size.width * 0.007369974,
        size.height * 0.09615434,
        size.width * 0.004339660,
        size.height * 0.09838627);
    path_1.close();
    path_1.moveTo(size.width * 0.8837408, size.height * 0.6533425);
    path_1.cubicTo(
        size.width * 0.8849215,
        size.height * 0.6533367,
        size.width * 0.8860759,
        size.height * 0.6534769,
        size.width * 0.8870602,
        size.height * 0.6537457);
    path_1.cubicTo(
        size.width * 0.8880445,
        size.height * 0.6540130,
        size.width * 0.8888141,
        size.height * 0.6543960,
        size.width * 0.8892644,
        size.height * 0.6548454);
    path_1.cubicTo(
        size.width * 0.8897173,
        size.height * 0.6552948,
        size.width * 0.8898325,
        size.height * 0.6557890,
        size.width * 0.8895942,
        size.height * 0.6562645);
    path_1.cubicTo(
        size.width * 0.8893586,
        size.height * 0.6567413,
        size.width * 0.8887827,
        size.height * 0.6571777,
        size.width * 0.8879398,
        size.height * 0.6575173);
    path_1.cubicTo(
        size.width * 0.8868168,
        size.height * 0.6579697,
        size.width * 0.8853089,
        size.height * 0.6582225,
        size.width * 0.8837408,
        size.height * 0.6582225);
    path_1.lineTo(size.width * 0.8148665, size.height * 0.6582225);
    path_1.cubicTo(
        size.width * 0.8136911,
        size.height * 0.6582254,
        size.width * 0.8125393,
        size.height * 0.6580838,
        size.width * 0.8115602,
        size.height * 0.6578165);
    path_1.cubicTo(
        size.width * 0.8105785,
        size.height * 0.6575477,
        size.width * 0.8098141,
        size.height * 0.6571662,
        size.width * 0.8093613,
        size.height * 0.6567182);
    path_1.cubicTo(
        size.width * 0.8089084,
        size.height * 0.6562702,
        size.width * 0.8087880,
        size.height * 0.6557775,
        size.width * 0.8090183,
        size.height * 0.6553020);
    path_1.cubicTo(
        size.width * 0.8092461,
        size.height * 0.6548266,
        size.width * 0.8098115,
        size.height * 0.6543902,
        size.width * 0.8106440,
        size.height * 0.6540477);
    path_1.cubicTo(
        size.width * 0.8117749,
        size.height * 0.6535939,
        size.width * 0.8132906,
        size.height * 0.6533410,
        size.width * 0.8148665,
        size.height * 0.6533425);
    path_1.lineTo(size.width * 0.8837408, size.height * 0.6533425);
    path_1.close();
    path_1.moveTo(size.width * 0.7657461, size.height * 0.6533425);
    path_1.cubicTo(
        size.width * 0.7669215,
        size.height * 0.6533396,
        size.width * 0.7680733,
        size.height * 0.6534812,
        size.width * 0.7690550,
        size.height * 0.6537500);
    path_1.cubicTo(
        size.width * 0.7700366,
        size.height * 0.6540173,
        size.width * 0.7708010,
        size.height * 0.6543988,
        size.width * 0.7712539,
        size.height * 0.6548468);
    path_1.cubicTo(
        size.width * 0.7717042,
        size.height * 0.6552948,
        size.width * 0.7718246,
        size.height * 0.6557876,
        size.width * 0.7715969,
        size.height * 0.6562630);
    path_1.cubicTo(
        size.width * 0.7713665,
        size.height * 0.6567384,
        size.width * 0.7708010,
        size.height * 0.6571749,
        size.width * 0.7699686,
        size.height * 0.6575173);
    path_1.cubicTo(
        size.width * 0.7688377,
        size.height * 0.6579697,
        size.width * 0.7673220,
        size.height * 0.6582225,
        size.width * 0.7657461,
        size.height * 0.6582225);
    path_1.lineTo(size.width * 0.6968717, size.height * 0.6582225);
    path_1.cubicTo(
        size.width * 0.6956963,
        size.height * 0.6582254,
        size.width * 0.6945445,
        size.height * 0.6580838,
        size.width * 0.6935654,
        size.height * 0.6578165);
    path_1.cubicTo(
        size.width * 0.6925838,
        size.height * 0.6575477,
        size.width * 0.6918194,
        size.height * 0.6571662,
        size.width * 0.6913665,
        size.height * 0.6567182);
    path_1.cubicTo(
        size.width * 0.6909136,
        size.height * 0.6562702,
        size.width * 0.6907932,
        size.height * 0.6557775,
        size.width * 0.6910236,
        size.height * 0.6553020);
    path_1.cubicTo(
        size.width * 0.6912513,
        size.height * 0.6548266,
        size.width * 0.6918194,
        size.height * 0.6543902,
        size.width * 0.6926518,
        size.height * 0.6540477);
    path_1.cubicTo(
        size.width * 0.6937801,
        size.height * 0.6535939,
        size.width * 0.6952958,
        size.height * 0.6533410,
        size.width * 0.6968717,
        size.height * 0.6533425);
    path_1.lineTo(size.width * 0.7657461, size.height * 0.6533425);
    path_1.close();
    path_1.moveTo(size.width * 0.6477513, size.height * 0.6533425);
    path_1.cubicTo(
        size.width * 0.6485602,
        size.height * 0.6533208,
        size.width * 0.6493717,
        size.height * 0.6533685,
        size.width * 0.6501335,
        size.height * 0.6534812);
    path_1.cubicTo(
        size.width * 0.6508979,
        size.height * 0.6535954,
        size.width * 0.6515969,
        size.height * 0.6537717,
        size.width * 0.6521859,
        size.height * 0.6540000);
    path_1.cubicTo(
        size.width * 0.6527775,
        size.height * 0.6542283,
        size.width * 0.6532487,
        size.height * 0.6545043,
        size.width * 0.6535707,
        size.height * 0.6548121);
    path_1.cubicTo(
        size.width * 0.6538927,
        size.height * 0.6551185,
        size.width * 0.6540602,
        size.height * 0.6554480,
        size.width * 0.6540602,
        size.height * 0.6557832);
    path_1.cubicTo(
        size.width * 0.6540602,
        size.height * 0.6561171,
        size.width * 0.6538927,
        size.height * 0.6564480,
        size.width * 0.6535707,
        size.height * 0.6567543);
    path_1.cubicTo(
        size.width * 0.6532487,
        size.height * 0.6570607,
        size.width * 0.6527775,
        size.height * 0.6573367,
        size.width * 0.6521859,
        size.height * 0.6575650);
    path_1.cubicTo(
        size.width * 0.6515969,
        size.height * 0.6577934,
        size.width * 0.6508979,
        size.height * 0.6579697,
        size.width * 0.6501335,
        size.height * 0.6580838);
    path_1.cubicTo(
        size.width * 0.6493717,
        size.height * 0.6581965,
        size.width * 0.6485602,
        size.height * 0.6582442,
        size.width * 0.6477513,
        size.height * 0.6582225);
    path_1.lineTo(size.width * 0.5787853, size.height * 0.6582225);
    path_1.cubicTo(
        size.width * 0.5776126,
        size.height * 0.6582211,
        size.width * 0.5764686,
        size.height * 0.6580766,
        size.width * 0.5754948,
        size.height * 0.6578078);
    path_1.cubicTo(
        size.width * 0.5745209,
        size.height * 0.6575390,
        size.width * 0.5737618,
        size.height * 0.6571575,
        size.width * 0.5733115,
        size.height * 0.6567124);
    path_1.cubicTo(
        size.width * 0.5728613,
        size.height * 0.6562673,
        size.width * 0.5727408,
        size.height * 0.6557760,
        size.width * 0.5729634,
        size.height * 0.6553020);
    path_1.cubicTo(
        size.width * 0.5731832,
        size.height * 0.6548280,
        size.width * 0.5737408,
        size.height * 0.6543916,
        size.width * 0.5745628,
        size.height * 0.6540477);
    path_1.cubicTo(
        size.width * 0.5756911,
        size.height * 0.6535939,
        size.width * 0.5772068,
        size.height * 0.6533410,
        size.width * 0.5787853,
        size.height * 0.6533425);
    path_1.lineTo(size.width * 0.6477513, size.height * 0.6533425);
    path_1.close();
    path_1.moveTo(size.width * 0.5297801, size.height * 0.6533425);
    path_1.cubicTo(
        size.width * 0.5305890,
        size.height * 0.6533208,
        size.width * 0.5314005,
        size.height * 0.6533685,
        size.width * 0.5321623,
        size.height * 0.6534812);
    path_1.cubicTo(
        size.width * 0.5329267,
        size.height * 0.6535954,
        size.width * 0.5336257,
        size.height * 0.6537717,
        size.width * 0.5342147,
        size.height * 0.6540000);
    path_1.cubicTo(
        size.width * 0.5348063,
        size.height * 0.6542283,
        size.width * 0.5352775,
        size.height * 0.6545043,
        size.width * 0.5355995,
        size.height * 0.6548121);
    path_1.cubicTo(
        size.width * 0.5359215,
        size.height * 0.6551185,
        size.width * 0.5360890,
        size.height * 0.6554480,
        size.width * 0.5360890,
        size.height * 0.6557832);
    path_1.cubicTo(
        size.width * 0.5360890,
        size.height * 0.6561171,
        size.width * 0.5359215,
        size.height * 0.6564480,
        size.width * 0.5355995,
        size.height * 0.6567543);
    path_1.cubicTo(
        size.width * 0.5352775,
        size.height * 0.6570607,
        size.width * 0.5348063,
        size.height * 0.6573367,
        size.width * 0.5342147,
        size.height * 0.6575650);
    path_1.cubicTo(
        size.width * 0.5336257,
        size.height * 0.6577934,
        size.width * 0.5329267,
        size.height * 0.6579697,
        size.width * 0.5321623,
        size.height * 0.6580838);
    path_1.cubicTo(
        size.width * 0.5314005,
        size.height * 0.6581965,
        size.width * 0.5305890,
        size.height * 0.6582442,
        size.width * 0.5297801,
        size.height * 0.6582225);
    path_1.lineTo(size.width * 0.4608586, size.height * 0.6582225);
    path_1.cubicTo(
        size.width * 0.4596911,
        size.height * 0.6582197,
        size.width * 0.4585497,
        size.height * 0.6580737,
        size.width * 0.4575812,
        size.height * 0.6578035);
    path_1.cubicTo(
        size.width * 0.4566099,
        size.height * 0.6575347,
        size.width * 0.4558534,
        size.height * 0.6571532,
        size.width * 0.4554058,
        size.height * 0.6567081);
    path_1.cubicTo(
        size.width * 0.4549581,
        size.height * 0.6562630,
        size.width * 0.4548403,
        size.height * 0.6557731,
        size.width * 0.4550628,
        size.height * 0.6553006);
    path_1.cubicTo(
        size.width * 0.4552853,
        size.height * 0.6548266,
        size.width * 0.4558403,
        size.height * 0.6543916,
        size.width * 0.4566597,
        size.height * 0.6540477);
    path_1.cubicTo(
        size.width * 0.4577853,
        size.height * 0.6535968,
        size.width * 0.4592906,
        size.height * 0.6533439,
        size.width * 0.4608586,
        size.height * 0.6533425);
    path_1.lineTo(size.width * 0.5297801, size.height * 0.6533425);
    path_1.close();
    path_1.moveTo(size.width * 0.4117853, size.height * 0.6533425);
    path_1.cubicTo(
        size.width * 0.4125628,
        size.height * 0.6533410,
        size.width * 0.4133351,
        size.height * 0.6534032,
        size.width * 0.4140550,
        size.height * 0.6535246);
    path_1.cubicTo(
        size.width * 0.4147749,
        size.height * 0.6536460,
        size.width * 0.4154293,
        size.height * 0.6538251,
        size.width * 0.4159817,
        size.height * 0.6540520);
    path_1.cubicTo(
        size.width * 0.4165314,
        size.height * 0.6542789,
        size.width * 0.4169686,
        size.height * 0.6545477,
        size.width * 0.4172670,
        size.height * 0.6548439);
    path_1.cubicTo(
        size.width * 0.4175654,
        size.height * 0.6551402,
        size.width * 0.4177199,
        size.height * 0.6554566,
        size.width * 0.4177199,
        size.height * 0.6557775);
    path_1.cubicTo(
        size.width * 0.4177251,
        size.height * 0.6564277,
        size.width * 0.4171099,
        size.height * 0.6570520,
        size.width * 0.4160079,
        size.height * 0.6575173);
    path_1.cubicTo(
        size.width * 0.4148717,
        size.height * 0.6579682,
        size.width * 0.4133613,
        size.height * 0.6582211,
        size.width * 0.4117853,
        size.height * 0.6582225);
    path_1.lineTo(size.width * 0.3429110, size.height * 0.6582225);
    path_1.cubicTo(
        size.width * 0.3417356,
        size.height * 0.6582254,
        size.width * 0.3405838,
        size.height * 0.6580838,
        size.width * 0.3396021,
        size.height * 0.6578165);
    path_1.cubicTo(
        size.width * 0.3386230,
        size.height * 0.6575477,
        size.width * 0.3378586,
        size.height * 0.6571662,
        size.width * 0.3374058,
        size.height * 0.6567182);
    path_1.cubicTo(
        size.width * 0.3369529,
        size.height * 0.6562702,
        size.width * 0.3368325,
        size.height * 0.6557775,
        size.width * 0.3370628,
        size.height * 0.6553020);
    path_1.cubicTo(
        size.width * 0.3372906,
        size.height * 0.6548266,
        size.width * 0.3378560,
        size.height * 0.6543902,
        size.width * 0.3386885,
        size.height * 0.6540477);
    path_1.cubicTo(
        size.width * 0.3398168,
        size.height * 0.6535925,
        size.width * 0.3413351,
        size.height * 0.6533396,
        size.width * 0.3429110,
        size.height * 0.6533425);
    path_1.lineTo(size.width * 0.4117853, size.height * 0.6533425);
    path_1.close();
    path_1.moveTo(size.width * 0.2937906, size.height * 0.6533425);
    path_1.cubicTo(
        size.width * 0.2949712,
        size.height * 0.6533367,
        size.width * 0.2961257,
        size.height * 0.6534769,
        size.width * 0.2971099,
        size.height * 0.6537457);
    path_1.cubicTo(
        size.width * 0.2980942,
        size.height * 0.6540130,
        size.width * 0.2988613,
        size.height * 0.6543960,
        size.width * 0.2993141,
        size.height * 0.6548454);
    path_1.cubicTo(
        size.width * 0.2997644,
        size.height * 0.6552948,
        size.width * 0.2998796,
        size.height * 0.6557890,
        size.width * 0.2996440,
        size.height * 0.6562645);
    path_1.cubicTo(
        size.width * 0.2994084,
        size.height * 0.6567413,
        size.width * 0.2988325,
        size.height * 0.6571777,
        size.width * 0.2979895,
        size.height * 0.6575173);
    path_1.cubicTo(
        size.width * 0.2968665,
        size.height * 0.6579697,
        size.width * 0.2953586,
        size.height * 0.6582225,
        size.width * 0.2937906,
        size.height * 0.6582225);
    path_1.lineTo(size.width * 0.2249173, size.height * 0.6582225);
    path_1.cubicTo(
        size.width * 0.2237408,
        size.height * 0.6582254,
        size.width * 0.2225890,
        size.height * 0.6580838,
        size.width * 0.2216086,
        size.height * 0.6578165);
    path_1.cubicTo(
        size.width * 0.2206280,
        size.height * 0.6575477,
        size.width * 0.2198631,
        size.height * 0.6571662,
        size.width * 0.2194105,
        size.height * 0.6567182);
    path_1.cubicTo(
        size.width * 0.2189581,
        size.height * 0.6562702,
        size.width * 0.2188385,
        size.height * 0.6557775,
        size.width * 0.2190673,
        size.height * 0.6553020);
    path_1.cubicTo(
        size.width * 0.2192958,
        size.height * 0.6548266,
        size.width * 0.2198623,
        size.height * 0.6543902,
        size.width * 0.2206948,
        size.height * 0.6540477);
    path_1.cubicTo(
        size.width * 0.2218241,
        size.height * 0.6535939,
        size.width * 0.2233401,
        size.height * 0.6533410,
        size.width * 0.2249173,
        size.height * 0.6533425);
    path_1.lineTo(size.width * 0.2937906, size.height * 0.6533425);
    path_1.close();
    path_1.moveTo(size.width * 0.1757958, size.height * 0.6533425);
    path_1.cubicTo(
        size.width * 0.1765751,
        size.height * 0.6533410,
        size.width * 0.1773474,
        size.height * 0.6534032,
        size.width * 0.1780688,
        size.height * 0.6535246);
    path_1.cubicTo(
        size.width * 0.1787901,
        size.height * 0.6536460,
        size.width * 0.1794458,
        size.height * 0.6538251,
        size.width * 0.1799992,
        size.height * 0.6540520);
    path_1.cubicTo(
        size.width * 0.1805526,
        size.height * 0.6542775,
        size.width * 0.1809924,
        size.height * 0.6545462,
        size.width * 0.1812935,
        size.height * 0.6548425);
    path_1.cubicTo(
        size.width * 0.1815945,
        size.height * 0.6551387,
        size.width * 0.1817510,
        size.height * 0.6554566,
        size.width * 0.1817542,
        size.height * 0.6557775);
    path_1.cubicTo(
        size.width * 0.1817605,
        size.height * 0.6561012,
        size.width * 0.1816105,
        size.height * 0.6564205,
        size.width * 0.1813131,
        size.height * 0.6567197);
    path_1.cubicTo(
        size.width * 0.1810154,
        size.height * 0.6570173,
        size.width * 0.1805764,
        size.height * 0.6572890,
        size.width * 0.1800215,
        size.height * 0.6575159);
    path_1.cubicTo(
        size.width * 0.1794668,
        size.height * 0.6577442,
        size.width * 0.1788071,
        size.height * 0.6579234,
        size.width * 0.1780814,
        size.height * 0.6580448);
    path_1.cubicTo(
        size.width * 0.1773558,
        size.height * 0.6581662,
        size.width * 0.1765788,
        size.height * 0.6582269,
        size.width * 0.1757958,
        size.height * 0.6582225);
    path_1.lineTo(size.width * 0.1069225, size.height * 0.6582225);
    path_1.cubicTo(
        size.width * 0.1061131,
        size.height * 0.6582442,
        size.width * 0.1053021,
        size.height * 0.6581965,
        size.width * 0.1045393,
        size.height * 0.6580838);
    path_1.cubicTo(
        size.width * 0.1037764,
        size.height * 0.6579697,
        size.width * 0.1030780,
        size.height * 0.6577934,
        size.width * 0.1024869,
        size.height * 0.6575650);
    path_1.cubicTo(
        size.width * 0.1018958,
        size.height * 0.6573367,
        size.width * 0.1014249,
        size.height * 0.6570607,
        size.width * 0.1011029,
        size.height * 0.6567543);
    path_1.cubicTo(
        size.width * 0.1007809,
        size.height * 0.6564480,
        size.width * 0.1006147,
        size.height * 0.6561171,
        size.width * 0.1006147,
        size.height * 0.6557832);
    path_1.cubicTo(
        size.width * 0.1006147,
        size.height * 0.6554480,
        size.width * 0.1007809,
        size.height * 0.6551185,
        size.width * 0.1011029,
        size.height * 0.6548121);
    path_1.cubicTo(
        size.width * 0.1014249,
        size.height * 0.6545043,
        size.width * 0.1018958,
        size.height * 0.6542283,
        size.width * 0.1024869,
        size.height * 0.6540000);
    path_1.cubicTo(
        size.width * 0.1030780,
        size.height * 0.6537717,
        size.width * 0.1037764,
        size.height * 0.6535954,
        size.width * 0.1045393,
        size.height * 0.6534812);
    path_1.cubicTo(
        size.width * 0.1053021,
        size.height * 0.6533685,
        size.width * 0.1061131,
        size.height * 0.6533208,
        size.width * 0.1069225,
        size.height * 0.6533425);
    path_1.lineTo(size.width * 0.1757958, size.height * 0.6533425);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.005235602;
    paint_1_stroke.color = Color(0xffC1C4C4).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.001308901, size.height * 0.02312139);
    path_2.cubicTo(
        size.width * 0.001308901,
        size.height * 0.01075085,
        size.width * 0.01947537,
        size.height * 0.0007225434,
        size.width * 0.04188482,
        size.height * 0.0007225434);
    path_2.lineTo(size.width * 0.9581152, size.height * 0.0007225434);
    path_2.cubicTo(
        size.width * 0.9805236,
        size.height * 0.0007225434,
        size.width * 0.9986911,
        size.height * 0.01075085,
        size.width * 0.9986911,
        size.height * 0.02312139);
    path_2.lineTo(size.width * 0.9986911, size.height * 0.1105491);
    path_2.lineTo(size.width * 0.001308901, size.height * 0.1105491);
    path_2.lineTo(size.width * 0.001308901, size.height * 0.02312139);
    path_2.close();

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_2_stroke.color = Color(0xffC1C4C4).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_stroke);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffF8FCFC).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

