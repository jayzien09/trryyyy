import 'package:artemis_webapp/admin/adminpanel/adminScreen.dart';
import 'package:artemis_webapp/admin/assessment/assessmentAdmin.dart';
import 'package:artemis_webapp/assessment/assessmentScreen.dart';
import 'package:artemis_webapp/assessment/question/environmental/envQuestionScreen.dart';
import 'package:artemis_webapp/assessment/question/governance/govQuestionScreen.dart';
import 'package:artemis_webapp/assessment/question/social/socQuestionScreen.dart';
import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/dashboard/dashboardScreen.dart';
import 'package:artemis_webapp/landing/landingSCreen.dart';
import 'package:artemis_webapp/models/admin.dart';
import 'package:artemis_webapp/profile/profileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCTBE1WUJAizHLvnd3Wl_LdA8hbh4OiFQ0",
    projectId: "artemis-f2a4c",
    messagingSenderId: "661406967576",
    appId: "1:661406967576:web:2f4577c1dd535adf0de06d",
    //Firebase Storage Bucket
    storageBucket: "gs://artemis-f2a4c.appspot.com",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'ARTEMIS',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthWrapper(),
        //home: const AuthWrapper(),
        // routes: <String, WidgetBuilder>{
        //   '/environmental': (BuildContext context) =>
        //       const EnvironmentalAssess(),
        //   //'/social': (BuildContext context) => MyPage(title: 'page B'),
        //   '/governance': (BuildContext context) => const GovernanceAssess(),
        // },
        onGenerateRoute: (appRoute) {
          switch (appRoute.name) {
            case '/governance':
              return PageTransition(
                  child: const GovernanceAssess(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 500));
              break;
            case '/social':
              return PageTransition(
                  child: const SocialAssess(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 500));
              break;
            case '/environmental':
              return PageTransition(
                  child: const EnvironmentalAssess(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 500));
              break;

            default:
              return null;
          }
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    final firebaseAdmin = context.watch<Admin?>();

    if (firebaseUser != null && firebaseUser.emailVerified) {
      return const AssessmentAdminScreen();
    } else if (firebaseAdmin != null) {
      return const AdminScreen();
    }
    return const LandingScreen();
  }
}
