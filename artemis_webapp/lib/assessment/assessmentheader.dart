import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class AssessmentHeader extends StatefulWidget {
  const AssessmentHeader({super.key});

  @override
  State<AssessmentHeader> createState() => _AssessmentHeaderState();
}

class _AssessmentHeaderState extends State<AssessmentHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'ESG Assessment',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
