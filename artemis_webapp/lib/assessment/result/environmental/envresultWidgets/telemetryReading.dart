import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TelemetryReading extends StatelessWidget {
  //const TelemetryReading({super.key});

  final String reading;
  final String title;
  final Color color;

  const TelemetryReading(
      {Key? key,
      required this.reading,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop(context)
          ? (MediaQuery.of(context).size.width / 2.95) / 3 - 15
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width
              : Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.5,
      height: 203,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(92, 158, 158, 158).withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.sensors,
            color: color,
            size: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(reading,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              Text(title,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              Text(
                'Reading',
                style: TextStyle(color: AppColors.grey, fontSize: 10),
              )
            ],
          ),
        ],
      ),
    );
  }
}
