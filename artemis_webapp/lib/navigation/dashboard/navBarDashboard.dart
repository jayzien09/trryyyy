import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/landing/landingScreen.dart';
import 'package:artemis_webapp/navigation/appLogo.dart';
import 'package:artemis_webapp/navigation/dashboard/navbarStatesDashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Some lines are commented out for the mean time to avoid errors

    final user = context.read<FirebaseAuthMethods>().user;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(10, 49, 49, 49),
              blurRadius: 25,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: const [
                  SizedBox(height: 30),
                  AppLogo(),
                  SizedBox(height: 30),
                  NavBarStates(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (() {
                        context.read<FirebaseAuthMethods>().signOut(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LandingScreen();
                        }));
                      }),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(top: 20.0, bottom: 20.0)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.lightblue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout,
                              color: AppColors.blueAccent, size: 15),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Logout',
                              style: TextStyle(
                                  color: AppColors.blueAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
