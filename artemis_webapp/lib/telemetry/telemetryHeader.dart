import 'package:artemis_webapp/header.dart';
import 'package:artemis_webapp/telemetry/simpleTel.dart';
import 'package:flutter/material.dart';

class TelemetryHeader extends StatefulWidget {
  const TelemetryHeader({super.key});

  @override
  State<TelemetryHeader> createState() => _TelemetryHeaderState();
}

class _TelemetryHeaderState extends State<TelemetryHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Header(
            title: 'Telemetry',
            subtitle1: 'With',
            subtitle2: 'Real-time',
            subtitle3: 'Database'),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SimpleTelemetry()));
              },
              child: Text('Simple Mode')),
        ),
      ],
    );
  }
}
