import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/assessment/result/environmental/envResultHeader.dart';
import 'package:artemis_webapp/assessment/result/environmental/envresultWidgets/criteria.dart';
import 'package:artemis_webapp/assessment/result/environmental/envresultWidgets/gaps.dart';
import 'package:artemis_webapp/assessment/result/environmental/envresultWidgets/graph.dart';
import 'package:artemis_webapp/assessment/result/environmental/envresultWidgets/recommendations.dart';
import 'package:artemis_webapp/assessment/result/environmental/envresultWidgets/telemetryReadingState.dart';
import 'package:artemis_webapp/calendar/calendarSection.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardDetails.dart';
import 'package:artemis_webapp/dashboard/dashboardReading.dart';
import 'package:artemis_webapp/navigation/dashboard/navBarDashboard.dart';
import 'package:flutter/material.dart';

class EnvironmentalResult extends StatefulWidget {
  const EnvironmentalResult({super.key});

  @override
  State<EnvironmentalResult> createState() => _EnvironmentalResultState();
}

class _EnvironmentalResultState extends State<EnvironmentalResult> {
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
              child: NavBar(),
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
                child: NavBar(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      top: 30, left: 50, right: 50, bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EnvironmentalResultHeader(),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Container(
                            //color: Colors.red,
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width *
                                    0.22 //0.205
                                : Responsive.isTablet(context)
                                    ? MediaQuery.of(context).size.width * 0.42
                                    : Responsive.isMobile(context)
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.width *
                                            0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Criteria(),
                                SizedBox(
                                  height: 20,
                                ),
                                Gaps(),
                                SizedBox(
                                  height: 20,
                                ),
                                Recommendations(),
                              ],
                            ),
                          ),
                          Container(
                            //color: Colors.blue,
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width * 0.34
                                : Responsive.isTablet(context)
                                    ? MediaQuery.of(context).size.width * 0.42
                                    : Responsive.isMobile(context)
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.width *
                                            0.5,
                            child: Column(
                              children: [
                                ScoreGraph(),
                                SizedBox(
                                  height: 20,
                                ),
                                //TelemetryItem(),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.298,
                                    width: MediaQuery.of(context).size.width,
                                    //margin: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: Decorations.borderRadius,
                                        boxShadow: [Decorations.boxShadow]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, right: 30, left: 30),
                                          child: Text('Sensor Readings',
                                              style: AppTextStyles.title),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          color: AppColors.greyAccentLine,
                                          height: 1,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            child: const SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: DashboardReading())),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
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
