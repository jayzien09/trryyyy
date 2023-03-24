import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class EnvironmentalResultHeader extends StatefulWidget {
  const EnvironmentalResultHeader({super.key});

  @override
  State<EnvironmentalResultHeader> createState() =>
      _EnvironmentalResultHeaderState();
}

class _EnvironmentalResultHeaderState extends State<EnvironmentalResultHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Environmental Assessment Result',
        subtitle1: 'Powered',
        subtitle2: 'By',
        subtitle3: 'Machine Learning');
  }
}
