import 'package:artemis_webapp/authentication/loginLeft.dart';
import 'package:artemis_webapp/authentication/phoneSignIn.dart';
import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/authentication/signUpScreen.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/landing/landingSCreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() async {
    context.read<FirebaseAuthMethods>().checkIfAdminOrUser(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const LoginScreenLeft(),
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
                    const SizedBox(height: 100),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 30),
                      child: Column(
                        children: [
                          Text(
                            'Login to your account',
                            style: AppTextStyles.headings,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Log in now to access your account and experience the full potential of Artemis',
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
                                      Text('Sign In with Google',
                                          style: AppTextStyles.tabs.copyWith(
                                              color: AppColors.black)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.14,
                                child: ElevatedButton(
                                  onPressed: (() {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const PhoneSignIn();
                                    }));
                                  }),
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
                                      Text('Sign In with Phone',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text('Forgot Password?',
                                      style: AppTextStyles.subtitle.copyWith(
                                          color: AppColors.blueAccent,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: login,
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
                                Text('Login',
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
                              Text("Doesn't have an account? ",
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
                                            child: const SignUpScreen()));
                                  },
                                  child: Text('Sign Up',
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
