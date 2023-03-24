import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';

class CriteriaHeader extends StatefulWidget {
  const CriteriaHeader({super.key});

  @override
  State<CriteriaHeader> createState() => _CriteriaHeaderState();
}

class _CriteriaHeaderState extends State<CriteriaHeader> {
  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Criteria',
        subtitle1: 'word1',
        subtitle2: 'word2',
        subtitle3: 'wprd3');
  }
}
