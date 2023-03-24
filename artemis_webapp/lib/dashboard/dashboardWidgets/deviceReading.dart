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
            const EdgeInsets.only(bottom: 15.0, left: 30, right: 30, top: 10),
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
