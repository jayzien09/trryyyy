import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/profile/esg%20section/esgWidget.dart';
import 'package:flutter/material.dart';

class ESGItems extends StatefulWidget {
  const ESGItems({super.key});

  @override
  State<ESGItems> createState() => _ESGItemsState();
}

class _ESGItemsState extends State<ESGItems> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: [
        ESGScore(
          score: envScore.round(),
          esg: 'Environmental',
          icon: const Icon(
            Icons.eco_rounded,
            size: 20,
            color: AppColors.green,
          ),
        ),
        ESGScore(
          score: socScore.round(),
          esg: 'Social',
          icon: const Icon(
            Icons.people_alt_rounded,
            size: 20,
            color: AppColors.red,
          ),
        ),
        ESGScore(
          score: govScore.round(),
          esg: 'Governance',
          icon: const Icon(
            Icons.account_balance_rounded,
            size: 20,
            color: AppColors.blue,
          ),
        ),
      ],
    );
  }
}
