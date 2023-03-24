import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class GovernanceHeader extends StatefulWidget {
  const GovernanceHeader({super.key});

  @override
  State<GovernanceHeader> createState() => _GovernanceHeaderState();
}

class _GovernanceHeaderState extends State<GovernanceHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Governance Assessment',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
