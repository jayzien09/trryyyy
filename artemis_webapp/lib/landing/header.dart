import 'package:artemis_webapp/authentication/loginScreen.dart';
import 'package:artemis_webapp/authentication/signUpScreen.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 170, vertical: 30),
      height: 120.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/Logo3.png',
                height: 40.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected1 = true;
                        selected2 = false;
                        selected3 = false;
                        selected4 = false;
                      });
                    },
                    child: HeaderNav(
                      selected: selected1,
                      text: 'Home',
                    ),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected1 = false;
                        selected2 = true;
                        selected3 = false;
                        selected4 = false;
                      });
                    },
                    child: HeaderNav(
                      selected: selected2,
                      text: 'How It Works',
                    ),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected1 = false;
                        selected2 = false;
                        selected3 = true;
                        selected4 = false;
                      });
                    },
                    child: HeaderNav(
                      selected: selected3,
                      text: 'FAQS',
                    ),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected1 = false;
                        selected2 = false;
                        selected3 = false;
                        selected4 = true;
                      });
                    },
                    child: HeaderNav(
                      selected: selected4,
                      text: 'About',
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 250.0,
              ),
              Row(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text('Sign Up', style: AppTextStyles.tabs1)),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    height: 20.0,
                    width: 1.0,
                    color: AppColors.greyAccentLine,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.black,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text('Log In', style: AppTextStyles.tabs1)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderNav extends StatefulWidget {
  final String text;
  final bool selected;

  HeaderNav({
    required this.selected,
    required this.text,
  });
  @override
  _HeaderNavState createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.text, style: AppTextStyles.tabs1),
        widget.selected
            ? SizedBox(
                height: 5.0,
              )
            : SizedBox(),
        widget.selected
            ? CircleAvatar(
                backgroundColor: AppColors.grey,
                radius: 2.0,
              )
            : SizedBox(),
      ],
    );
  }
}
