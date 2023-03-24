import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/authentication/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneSignIn extends StatefulWidget {
  const PhoneSignIn({super.key});

  @override
  State<PhoneSignIn> createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void phoneSignIn() {
    context
        .read<FirebaseAuthMethods>()
        .phoneSignIn(phoneNumber: phoneController.text, context: context);
    // FirebaseAuthMethods(FirebaseAuth.instance).phoneSignIn(
    //   phoneNumber: phoneController.text,
    //   context: context,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          const Text('PHONE SIGN IN PAGE', style: TextStyle(fontSize: 30)),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: 'Enter Phone',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
            ),
            onPressed: phoneSignIn,
            child: const Text('Send OTP'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
            child: const Text('does not have an account?'),
          ),
        ],
      ),
    )));
  }
}
