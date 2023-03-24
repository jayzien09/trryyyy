import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class SocialsHeader extends StatefulWidget {
  const SocialsHeader({super.key});

  @override
  State<SocialsHeader> createState() => _SocialsHeaderState();
}

class _SocialsHeaderState extends State<SocialsHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Sustainability Socials',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
