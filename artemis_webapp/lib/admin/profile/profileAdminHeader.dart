import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class ProfileAdminHeader extends StatefulWidget {
  const ProfileAdminHeader({super.key});

  @override
  State<ProfileAdminHeader> createState() => _ProfileAdminHeaderState();
}

class _ProfileAdminHeaderState extends State<ProfileAdminHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Admin Profile Panel',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
