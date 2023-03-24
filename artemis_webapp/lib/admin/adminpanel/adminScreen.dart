import 'package:artemis_webapp/admin/adminpanel/adminHeader.dart';
import 'package:artemis_webapp/admin/adminpanel/adminTools.dart';
import 'package:artemis_webapp/admin/adminpanel/analytics.dart';
import 'package:artemis_webapp/admin/adminpanel/graph.dart';
import 'package:artemis_webapp/admin/adminpanel/maps.dart';
import 'package:artemis_webapp/admin/adminpanel/records.dart';
import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/navigation/admin/adminNav/navBarAdmin.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
              child: NavBarAdmin(),
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
                child: NavBarAdmin(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AdminHeader(),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            Graph(),
                            AdminMaps(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            Column(
                              children: [
                                Analytics(),
                                SizedBox(height: 20),
                                OverviewReading(),
                              ],
                            ),
                            AdminTools(),
                          ],
                        ),
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
