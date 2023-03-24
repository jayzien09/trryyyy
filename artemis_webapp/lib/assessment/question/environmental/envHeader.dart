import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class EnvironmentalHeader extends StatefulWidget {
  const EnvironmentalHeader({super.key});

  @override
  State<EnvironmentalHeader> createState() => _EnvironmentalHeaderState();
}

class _EnvironmentalHeaderState extends State<EnvironmentalHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Environmental Assessment',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
