import 'package:artemis_webapp/authentication/loginScreen.dart';
import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/authentication/signupLeft.dart';
import 'package:artemis_webapp/landing/landingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController companynameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confpassController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() async {
    context.read<FirebaseAuthMethods>().signUpAdmin(
        //companyName: companynameController.text,
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  bool _isObscure = false;
  bool _isObscure1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const SignUpScreenLeft(),
              Container(
                padding: const EdgeInsets.all(50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            width: 200,
                            height: 70,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: const LandingScreen()));
                                },
                                child: Image(
                                    image:
                                        AssetImage('assets/images/Logo3.png')),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 30),
                      child: Column(
                        children: [
                          Text(
                            'Sign up for an account',
                            style: AppTextStyles.headings,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Create an account to get started',
                              style: AppTextStyles.subtitle),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.14,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: AppColors.greyAccentLine),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'assets/icons/google.png'),
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text('Sign Up with Google',
                                          style: AppTextStyles.tabs.copyWith(
                                              color: AppColors.black)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.14,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: AppColors.greyAccentLine),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: AppColors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('Sign Up with Phone',
                                          style: AppTextStyles.name),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.11,
                                color: AppColors.greyAccentLine,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.07,
                                child: Center(
                                  child: Text('Or with email',
                                      style: AppTextStyles.subtitle),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.11,
                                color: AppColors.greyAccentLine,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: companynameController,
                            decoration: InputDecoration(
                              hintText: 'Enter Company Name',
                              hintStyle: AppTextStyles.tabs,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.greyAccentLine,
                                ),
                              ),
                              // border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              hintStyle: AppTextStyles.tabs,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.greyAccentLine,
                                ),
                              ),
                              // border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: !_isObscure,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: AppTextStyles.tabs,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.greyAccentLine,
                                ),
                              ),
                              // border: OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 1),
                              ),
                              suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: confpassController,
                            obscureText: !_isObscure1,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: AppTextStyles.tabs,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.greyAccentLine,
                                ),
                              ),
                              // border: OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 1),
                              ),
                              suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  icon: Icon(_isObscure1
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure1 = !_isObscure1;
                                    });
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'By Creating an account, you agree to our ',
                                style: AppTextStyles.body1
                                    .copyWith(color: AppColors.grey),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Terms of Service',
                                    style: AppTextStyles.body1,
                                  ),
                                ),
                              ),
                              Text(
                                ' and ',
                                style: AppTextStyles.body1
                                    .copyWith(color: AppColors.grey),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Privacy Policy',
                                    style: AppTextStyles.body1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: signUp,
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 30.0)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.blueAccent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                                Text('Sign Up',
                                    style: AppTextStyles.name
                                        .copyWith(color: AppColors.white)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  style: AppTextStyles.subtitle),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            child: const LoginScreen()));
                                  },
                                  child: Text('Sign In',
                                      style: AppTextStyles.subtitle.copyWith(
                                          color: AppColors.blueAccent,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
