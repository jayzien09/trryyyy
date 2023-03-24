import 'package:artemis_webapp/admin/adminpanel/adminScreen.dart';
import 'package:artemis_webapp/admin/assessment/assessmentAdmin.dart';
import 'package:artemis_webapp/admin/profile/profileAdmin.dart';
import 'package:artemis_webapp/admin/settings/settingsAdminScreen.dart';
import 'package:artemis_webapp/admin/socials/socialsAdminScreen.dart';
import 'package:artemis_webapp/admin/telemetry/telemetryAdmin.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/navigation/navbarItem.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SocialsStateAdmin extends StatefulWidget {
  const SocialsStateAdmin({Key? key}) : super(key: key);

  @override
  _SocialsStateAdminState createState() => _SocialsStateAdminState();
}

class _SocialsStateAdminState extends State<SocialsStateAdmin> {
  List<bool> selected = [false, false, false, true, false, false];
  void select(int n) {
    for (int i = 0; i < 6; i++) {
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
            text: 'Admin',
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
                      child: const AdminScreen()));
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
                      child: const AssessmentAdminScreen()));
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
                      child: const TelemetryAdminScreen()));
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
                      child: const SocialsAdminScreen()));
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
                      child: const ProfileAdminScreen()));
            },
          ),
          // isAdmin
          //     ? NavBarItem(
          //         icon: Icons.admin_panel_settings_rounded,
          //         text: 'Admin',
          //         active: selected[5],
          //         touched: () {
          //           setState(() {
          //             select(5);
          //           });
          //           Navigator.push(
          //               context,
          //               PageTransition(
          //                   type: PageTransitionType.fade,
          //                   duration: const Duration(milliseconds: 800),
          //                   child: const AdminScreen()));
          //         },
          //       )
          //     : SizedBox(),
          NavBarItem(
            icon: Icons.settings,
            text: 'Settings',
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
                      child: const SettingsAdminScreen()));
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
