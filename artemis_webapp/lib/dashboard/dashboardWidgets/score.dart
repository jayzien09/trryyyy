import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ESGScore extends StatefulWidget {
  const ESGScore({super.key});

  @override
  State<ESGScore> createState() => _ESGScoreState();
}

class _ESGScoreState extends State<ESGScore> {
  Future<void> getScores() async {
    final user = context.read<User?>();
    final companyData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      esgScore = companyData['esgScore'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScores();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: Decorations.borderRadius,
        boxShadow: [
          Decorations.boxShadow,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overall ESG Score',
                style: AppTextStyles.title,
              ),
              Text(
                'Subtitle',
                style: AppTextStyles.body,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                esgScore.round().toString(),
                style: AppTextStyles.score,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
