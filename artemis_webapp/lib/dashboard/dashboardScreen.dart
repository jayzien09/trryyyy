import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardDetails.dart';
import 'package:artemis_webapp/dashboard/dashboardHeaderState.dart';
import 'package:artemis_webapp/dashboard/dashboardProgressCard.dart';
import 'package:artemis_webapp/dashboard/dashboardWidgets/iot.dart';
import 'package:artemis_webapp/dashboard/dashboardWidgets/lineChart.dart';
import 'package:artemis_webapp/dashboard/dashboardWidgets/map.dart';
import 'package:artemis_webapp/navigation/dashboard/navBarDashboard.dart';
import 'package:flutter/material.dart';

import '../calendar/calendarSection.dart';
import 'dashboardWidgets/score.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
              const Expanded(
                flex: 2,
                child: NavBar(),
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
                      const DashboardHeaderStates(),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.start,
                        children: [
                          const ESGScore(),
                          const Partners(),
                          const DashboardCard(),
                          Container(
                              padding: const EdgeInsets.all(30),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.38,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: Decorations.borderRadius,
                                boxShadow: [
                                  Decorations.boxShadow,
                                ],
                              ),
                              child: const LineChartSample1()),
                          const IotEdge(),
                        ],
                      ),
                      if (!Responsive.isDesktop(context))
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.05,
                        // ),
                        const DashboardDetails()
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
