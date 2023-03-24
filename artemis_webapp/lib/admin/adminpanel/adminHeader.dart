import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class AdminHeader extends StatefulWidget {
  const AdminHeader({super.key});

  @override
  State<AdminHeader> createState() => _AdminHeaderState();
}

class _AdminHeaderState extends State<AdminHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Admin Panel',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
