import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class DeviceReading extends StatefulWidget {
  final String sensorName;
  final Color color;
  final String sensorReading;
  final IconData icon;

  DeviceReading({
    required this.color,
    required this.sensorReading,
    required this.sensorName,
    required this.icon,
  });

  @override
  _DeviceReadingState createState() => _DeviceReadingState();
}

class _DeviceReadingState extends State<DeviceReading> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 275),
        margin:
            const EdgeInsets.only(bottom: 10.0, left: 30, right: 30, top: 10),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: hovered
                ? [
                    const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 13.0,
                      spreadRadius: 0.0,
                    ),
                  ]
                : []),
        child: Column(
          children: [
            Container(
              height: 33.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        height: 28.0,
                        width: 28.0,
                        decoration: BoxDecoration(
                          color: widget.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.sensors,
                            color: widget.color,
                            size: 15.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        widget.sensorName,
                        style: AppTextStyles.body2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          widget.sensorReading,
                          style: AppTextStyles.body2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewReading extends StatefulWidget {
  const OverviewReading({super.key});

  @override
  State<OverviewReading> createState() => _OverviewReadingState();
}

class _OverviewReadingState extends State<OverviewReading> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: width / 2.3,
      height: height / 3.24,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: Decorations.borderRadius,
        boxShadow: [Decorations.boxShadow],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Bucket",
                    style: AppTextStyles.title,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: AppColors.yellow,
                        size: 10.0,
                      ),
                      SizedBox(width: 5.0),
                      Text('Pending', style: AppTextStyles.body),
                      SizedBox(width: 20.0),
                      Icon(
                        Icons.circle,
                        color: AppColors.blue,
                        size: 10.0,
                      ),
                      SizedBox(width: 5.0),
                      Text('On Process', style: AppTextStyles.body),
                      SizedBox(width: 20.0),
                      Icon(
                        Icons.circle,
                        color: AppColors.green,
                        size: 10.0,
                      ),
                      SizedBox(width: 5.0),
                      Text('Done', style: AppTextStyles.body),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
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
        ),
      ),
    );
  }
}
