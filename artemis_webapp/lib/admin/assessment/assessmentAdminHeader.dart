import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class AssessmentAdminHeader extends StatefulWidget {
  const AssessmentAdminHeader({super.key});

  @override
  State<AssessmentAdminHeader> createState() => _AssessmentAdminHeaderState();
}

class _AssessmentAdminHeaderState extends State<AssessmentAdminHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Admin Assessment Panel',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
