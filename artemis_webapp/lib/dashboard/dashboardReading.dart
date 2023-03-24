import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardWidgets/deviceReading.dart';
import 'package:flutter/material.dart';

class DashboardReading extends StatefulWidget {
  const DashboardReading({super.key});

  @override
  State<DashboardReading> createState() => _DashboardReadingState();
}

class _DashboardReadingState extends State<DashboardReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeviceReading(
          color: AppColors.brownTelemetry,
          sensorName: 'CO2 Emissions',
          sensorReading: 'Good',
          icon: Icons.air_rounded,
        ),
        DeviceReading(
          color: AppColors.yellowTelemetry,
          sensorName: 'Ambient Light',
          sensorReading: 'Good',
          icon: Icons.wb_incandescent_outlined,
        ),
        DeviceReading(
          color: AppColors.red,
          sensorName: 'Ambient Sound',
          sensorReading: 'Good',
          icon: Icons.wifi_tethering_rounded,
        ),
        DeviceReading(
          color: AppColors.pinkTelemetry,
          sensorName: 'Motion Detection',
          sensorReading: 'Detected',
          icon: Icons.speed_rounded,
        ),
        DeviceReading(
          color: AppColors.bluegreenTelemetry,
          sensorName: 'Humidity',
          sensorReading: 'Good',
          icon: Icons.water_rounded,
        ),
        DeviceReading(
          color: AppColors.blueTelemetry,
          sensorName: 'Air Quality',
          sensorReading: 'Good',
          icon: Icons.air_rounded,
        ),
        DeviceReading(
          color: AppColors.greenTelemetry,
          sensorName: 'Water Quality',
          sensorReading: 'Good',
          icon: Icons.water_rounded,
        ),
        DeviceReading(
          color: AppColors.purpleTelemetry,
          sensorName: 'temperature',
          sensorReading: 'Detected',
          icon: Icons.thermostat_rounded,
        ),
      ],
    );
  }
}
