import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class TelemetryAdminHeader extends StatefulWidget {
  const TelemetryAdminHeader({super.key});

  @override
  State<TelemetryAdminHeader> createState() => _TelemetryAdminHeaderState();
}

class _TelemetryAdminHeaderState extends State<TelemetryAdminHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Admin Telemetry Panel',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
