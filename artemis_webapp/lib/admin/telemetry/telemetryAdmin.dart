import 'package:artemis_webapp/admin/telemetry/telemetryAdminHeader.dart';
import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/navigation/admin/telemetry/telemetryAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelemetryAdminScreen extends StatefulWidget {
  const TelemetryAdminScreen({super.key});

  @override
  State<TelemetryAdminScreen> createState() => _TelemetryAdminScreenState();
}

class _TelemetryAdminScreenState extends State<TelemetryAdminScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  int userCount = 0;

  //get user count
  void getUserCount() async {
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('users').get();
    final List<DocumentSnapshot> documents = result.docs;
    setState(() {
      userCount = documents.length;
      print('userCount: $userCount');
    });
  }

  @override
  void initState() {
    super.initState();
    getUserCount();
  }

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
              child: TelemetryAdmin(),
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
                child: TelemetryAdmin(),
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
                      const TelemetryAdminHeader(),
                      const SizedBox(
                        height: 10,
                      ),
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
