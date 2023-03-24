import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/assessment/ESGAssessment.dart';
import 'package:artemis_webapp/assessment/assessmentheader.dart';
import 'package:artemis_webapp/assessment/criteriaItems.dart';
import 'package:artemis_webapp/assessment/tabs.dart';
import 'package:artemis_webapp/auth_methods/authMethods.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardDetails.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/navigation/assessment/navBarAssessment.dart';
import 'package:flutter/material.dart';

import '../calendar/calendarSection.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AssessmentHeader(),
                      SizedBox(
                        height: 10,
                      ),
                      AssessmentTabs(),
                      SizedBox(
                        height: 30,
                      ),
                      ESGAssessment(),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Criteria', style: AppTextStyles.headings),
                      Text('Criteria', style: AppTextStyles.subHeadings),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 390,
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 40),
                              width: MediaQuery.of(context).size.width * 0.184,
                              height: 390,
                              decoration: BoxDecoration(
                                borderRadius: Decorations.borderRadius,
                                color: AppColors.white,
                                boxShadow: [
                                  Decorations.boxShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Bases',
                                          style: AppTextStyles.headings),
                                      Text('for Assessment',
                                          style: AppTextStyles.subtitle),
                                    ],
                                  ),
                                  Text(
                                    'The rating criteria have been developed in accordance with ICCR’s “Principles for Global Corporate Responsibility: Benchmarks for Measuring Business Performance"  and is inspired by the principles developed by International Bodies dedicated to Responsible Investment such as UN Global Compact, the Global Reporting Initiative and UN PRI. ',
                                    style: AppTextStyles.subtitle,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    width: MediaQuery.of(context).size.width *
                                        0.184 /
                                        2.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.lightgreen),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.verified_rounded,
                                          color: AppColors.green,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('Verified by ESG Analyst',
                                            style: AppTextStyles.body1.copyWith(
                                                color: AppColors.green)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width *
                                        0.184 *
                                        2 +
                                    20,
                                child: CriteriaItems()),
                          ],
                        ),
                      ),
                    ],
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
