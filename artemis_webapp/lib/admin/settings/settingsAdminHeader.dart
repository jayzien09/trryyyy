import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class SettingsAdminHeader extends StatefulWidget {
  const SettingsAdminHeader({super.key});

  @override
  State<SettingsAdminHeader> createState() => _SettingsAdminHeaderState();
}

class _SettingsAdminHeaderState extends State<SettingsAdminHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Admin Settings Panel',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
