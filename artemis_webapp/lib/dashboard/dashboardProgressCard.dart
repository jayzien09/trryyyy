import 'package:artemis_webapp/assessment/result/environmental/envResult.dart';
import 'package:artemis_webapp/assessment/scores.dart';
import 'package:artemis_webapp/auth_methods/authMethods.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardWidgets/ProgressCard.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({super.key});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  Future<void> getScores() async {
    final user = context.read<User?>();
    final companyData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      envScore = companyData['envScore'];
      socScore = companyData['socScore'];
      govScore = companyData['govScore'];
      lastAssessmentDateEnvDB = companyData['lastAssessDateEnv'];
      isAssessedEnvDB = companyData['isAssessedEnv'];
      lastAssessmentDateSocDB = companyData['lastAssessDateSoc'];
      isAssessedSocDB = companyData['isAssessedSoc'];
      lastAssessmentDateGovDB = companyData['lastAssessDateGov'];
      isAssessedGovDB = companyData['isAssessedGov'];
      DateTime parseDateEnv =
          DateFormat("yyyy-MM-dd").parse(lastAssessmentDateEnvDB);
      String formatDateEnv = DateFormat("yMMMM").format(parseDateEnv);

      DateTime parseDateSoc =
          DateFormat("yyyy-MM-dd").parse(lastAssessmentDateSocDB);
      String formatDateSoc = DateFormat("yMMMM").format(parseDateSoc);

      DateTime parseDateGov =
          DateFormat("yyyy-MM-dd").parse(lastAssessmentDateGovDB);
      String formatDateGov = DateFormat("yMMMM").format(parseDateGov);

      lastAssessDateEnv = formatDateEnv;
      lastAssessDateSoc = formatDateSoc;
      lastAssessDateGov = formatDateGov;
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
      //margin: const EdgeInsets.only(top: 5.0),
      height: Responsive.isMobile(context) ? null : 175,
      width: MediaQuery.of(context).size.width,
      //color: Colors.red,
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 500),
                        child: const EnvironmentalResult()));
              },
              child: ProgressCard(
                color: AppColors.green,
                projectName: 'Environmental',
                percentComplete: '${envScore.round()}%',
                progressIndicatorColor: AppColors.green,
                icon: Icons.eco_rounded, //compost_rounded,
                percent: envScore.round(),
                dateAssessed: lastAssessDateEnv,
              ),
            ),
          ),
          ProgressCard(
            color: AppColors.redTelemetry,
            projectName: 'Social',
            percentComplete: '${socScore.round()}%',
            progressIndicatorColor: AppColors.redTelemetry,
            icon: Icons.groups_rounded, //connect_without_contact_rounded,
            percent: socScore.round(),
            dateAssessed: lastAssessDateSoc,
          ),
          ProgressCard(
            color: AppColors.blueTelemetry,
            projectName: 'Governance',
            percentComplete: '${govScore.round()}%',
            progressIndicatorColor: AppColors.blueTelemetry,
            icon: Icons.account_balance_rounded,
            percent: govScore.round(),
            dateAssessed: lastAssessDateGov,
          ),
        ],
      ),
    );
  }
}
