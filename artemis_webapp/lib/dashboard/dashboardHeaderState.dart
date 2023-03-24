import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardHeaderStates extends StatefulWidget {
  const DashboardHeaderStates({super.key});

  @override
  State<DashboardHeaderStates> createState() => _DashboardHeaderStatesState();
}

class _DashboardHeaderStatesState extends State<DashboardHeaderStates> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    if (user != null) {
      return Header(
          title: 'Welcome To Your Dashboard',
          subtitle1: user.displayName ?? 'No Company Name',
          subtitle2: '',
          subtitle3: '');
    } else {
      return const SizedBox();
    }
  }
}
