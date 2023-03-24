import 'package:artemis_webapp/admin/adminpanel/adminScreen.dart';
import 'package:artemis_webapp/assessment/assessmentScreen.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardScreen.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/navigation/navbarItem.dart';
import 'package:artemis_webapp/profile/profileScreen.dart';
import 'package:artemis_webapp/socials/socialScreen.dart';
import 'package:artemis_webapp/telemetry/telemetryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';

class NavBarStates extends StatefulWidget {
  const NavBarStates({Key? key}) : super(key: key);

  @override
  _NavBarStatesState createState() => _NavBarStatesState();
}

class _NavBarStatesState extends State<NavBarStates> {
  List<bool> selected = [true, false, false, false, false, false, false];
  void select(int n) {
    for (int i = 0; i < 7; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.0,
      child: Column(
        children: [
          NavBarItem(
            icon: Icons.dashboard,
            text: 'Dashboard',
            active: selected[0],
            touched: () {
              setState(() {
                select(0);
              });
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      child: const DashboardScreen()));
            },
          ),
          NavBarItem(
            icon: Icons.receipt_long,
            text: 'Assessment',
            active: selected[1],
            touched: () {
              setState(() {
                select(1);
              });
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      child: const AssessmentScreen()));
            },
          ),
          NavBarItem(
            icon: Icons.sensors,
            text: 'Telemetry',
            active: selected[2],
            touched: () {
              setState(() {
                select(2);
              });
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      child: const TelemetryScreen()));
            },
          ),
          NavBarItem(
            icon: Icons.people_rounded,
            text: 'Socials',
            active: selected[3],
            touched: () {
              setState(() {
                select(3);
              });
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      child: const SocialScreen()));
            },
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 20, left: 40.0, right: 40, bottom: 20),
            child: const Divider(
              color: AppColors.grey,
              thickness: 0.5,
            ),
          ),
          NavBarItem(
            icon: Icons.person,
            text: 'Profile',
            active: selected[4],
            touched: () {
              setState(() {
                select(4);
              });
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      child: const ProfileScreen()));
            },
          ),
          isAdmin
              ? NavBarItem(
                  icon: Icons.admin_panel_settings_rounded,
                  text: 'Admin',
                  active: selected[5],
                  touched: () {
                    setState(() {
                      select(5);
                    });
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 800),
                            child: const AdminScreen()));
                  },
                )
              : SizedBox(),
          NavBarItem(
            icon: Icons.settings,
            text: 'Settings',
            active: selected[6],
            touched: () {
              setState(() {
                select(6);
              });
            },
          ),
          // NavBarItem(
          //   icon: Feather.log_out,
          //   text: 'Logout',
          //   active: false,
          //   touched: () {
          //     //facultyCredential.setString('');
          //   },
          // ),
        ],
      ),
    );
  }
}
