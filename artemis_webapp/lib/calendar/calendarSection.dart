import 'package:artemis_webapp/calendar/calendarWeekly.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dateNow = DateFormat("MMMM yyyy").format(DateTime.now());
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dateNow, style: AppTextStyles.title1),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: const [
              CalendarWeekly(),
            ],
          ),
        ),
      ],
    );
  }
}
