import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class SocialsAdminHeader extends StatefulWidget {
  const SocialsAdminHeader({super.key});

  @override
  State<SocialsAdminHeader> createState() => _SocialsAdminHeaderState();
}

class _SocialsAdminHeaderState extends State<SocialsAdminHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Admin Socials Panel',
        subtitle1: 'With',
        subtitle2: 'Real-time',
        subtitle3: 'Database');
  }
}
