import 'dart:ui';

import 'package:artemis_webapp/admin/assessment/addQuestion.dart';
import 'package:artemis_webapp/admin/assessment/assessmentAdminHeader.dart';
import 'package:artemis_webapp/admin/assessment/envAssessment.dart';
import 'package:artemis_webapp/admin/assessment/textfield.dart';
import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/navigation/admin/assessment/assessmentAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AssessmentAdminScreen extends StatefulWidget {
  const AssessmentAdminScreen({super.key});

  @override
  State<AssessmentAdminScreen> createState() => _AssessmentAdminScreenState();
}

class _AssessmentAdminScreenState extends State<AssessmentAdminScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //print('userCount: $userCount');
    return Scaffold(
      key: _drawerKey,
      drawer: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [
            SizedBox(
              width: 260,
              child: AssessmentAdmin(),
            ),
          ],
        ),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black)),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 2,
                child: AssessmentAdmin(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AssessmentAdminHeader(),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 500),
                                    child: const EnvAssessmentAdminScreen()));
                          },
                          child: Text('Environmental ')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
