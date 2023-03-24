// import 'package:artemis_webapp/authentication/loginScreen.dart';
// import 'package:artemis_webapp/authentication/phoneSignIn.dart';
// import 'package:flutter/material.dart';

// class LandingScreen extends StatelessWidget {
//   const LandingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Column(
//       children: [
//         const Text('LANDING SCREEN', style: TextStyle(fontSize: 30)),
//         const SizedBox(
//           height: 20,
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             minimumSize: const Size(double.infinity, 40),
//           ),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return const PhoneSignIn();
//             }));
//           },
//           child: const Text('Phone Sign In'),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             minimumSize: const Size(double.infinity, 40),
//           ),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return const LoginScreen();
//             }));
//           },
//           child: const Text('Email Sign In'),
//         ),
//       ],
//     )));
//   }
// }
