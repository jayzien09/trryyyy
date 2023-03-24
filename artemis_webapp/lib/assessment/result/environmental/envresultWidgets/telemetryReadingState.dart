import 'package:artemis_webapp/assessment/result/environmental/envresultWidgets/telemetryReading.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class TelemetryItem extends StatefulWidget {
  const TelemetryItem({super.key});

  @override
  State<TelemetryItem> createState() => _TelemetryItemState();
}

class _TelemetryItemState extends State<TelemetryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop(context)
          ? (MediaQuery.of(context).size.width / 2.95)
          : Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * 0.5,
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        children: [
          TelemetryReading(
            reading: 'Good',
            title: 'Carbon Emissions',
            color: AppColors.green,
          ),
          TelemetryReading(
            reading: 'Good',
            title: 'Carbon Emissions',
            color: AppColors.yellow,
          ),
          TelemetryReading(
            reading: 'Good',
            title: 'Carbon Emissions',
            color: AppColors.blue,
          ),
        ],
      ),
    );
  }
}
