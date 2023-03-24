import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class SocialHeader extends StatefulWidget {
  const SocialHeader({super.key});

  @override
  State<SocialHeader> createState() => _SocialHeaderState();
}

class _SocialHeaderState extends State<SocialHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Social Assessment',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
