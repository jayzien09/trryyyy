import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/assessment/assessmentScreen.dart';
import 'package:artemis_webapp/assessment/question/environmental/envHeader.dart';
import 'package:artemis_webapp/assessment/question/environmental/envQuestionScreen.dart';
import 'package:artemis_webapp/assessment/question/governance/govFileUpload.dart';
import 'package:artemis_webapp/assessment/question/governance/govHeader.dart';
import 'package:artemis_webapp/assessment/result/environmental/envResultHeader.dart';
import 'package:artemis_webapp/calendar/calendarSection.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardDetails.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/navigation/assessment/navBarAssessment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class EnvironmentalSuccess extends StatefulWidget {
  const EnvironmentalSuccess({super.key});

  @override
  State<EnvironmentalSuccess> createState() => _EnvironmentalSuccessState();
}

class _EnvironmentalSuccessState extends State<EnvironmentalSuccess> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // Future<void> getScores() async {
  //   final user = context.read<User?>();
  //   final companyData = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get();
  //   setState(() {
  //     envScore = companyData['envScore'];
  //     socScore = companyData['socScore'];
  //     govScore = companyData['govScore'];
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getScores();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [
            SizedBox(
              width: 260,
              child: NavBarAssessment(),
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
              const Flexible(
                flex: 2,
                child: NavBarAssessment(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Color(0xFFFAFAFA),
                    padding:
                        const EdgeInsets.only(top: 30, left: 50, right: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EnvironmentalHeader(),
                        SizedBox(
                          height: 30,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      //duration: const Duration(seconds: 1),
                                      child: const AssessmentScreen()));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 15,
                                  color: AppColors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Return to Assessment Page',
                                  style: AppTextStyles.tabs
                                      .copyWith(color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                  //padding: const EdgeInsets.only(bot60),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //color: AppColors.greyAccent,
                                  ),
                                  child: Image.asset(
                                      'assets/icons/successful.gif',
                                      gaplessPlayback: false,
                                      height: 400,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      fit: BoxFit.cover)),
                              Text(
                                  'Assessment has been successfully submitted!',
                                  style: AppTextStyles.headings),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 800,
                                child: Text(
                                  'Please wait for the environmental results within 24 hours. ',
                                  style: AppTextStyles.tabs,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 140,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(8, 114, 114, 114),
                          blurRadius: 25,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        children: const [
                          AppBarActionItems(),
                          SizedBox(height: 15),
                          CalendarSection(),
                          DashboardDetails()
                        ],
                      ),
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
