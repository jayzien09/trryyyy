import 'dart:math';

import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.5 - 120,
      child: Stack(
        children: [
          //container for first section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('The Best and Most Trusted\nESG Assessment Tool',
                    style:
                        AppTextStyles.landing.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                      'Artemis envisions that by using this assessment tool, every company can contribute\nto environmental protection and climate change mitigation.',
                      style: AppTextStyles.name.copyWith(color: AppColors.grey),
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30.0)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.blueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Get Started',
                            style: AppTextStyles.name
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform(
            transform: Matrix4.rotationZ(pi / 6)..translate(-440.0, 140.0),
            child: Container(
              height: 2250.0,
              width: 1200.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(300.0),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              left: 170,
              child: Container(
                  width: MediaQuery.of(context).size.width - 340,
                  //margin: const EdgeInsets.symmetric(horizontal: 170),
                  decoration: BoxDecoration(
                    borderRadius: Decorations.borderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: ClipRRect(
                      borderRadius: Decorations.borderRadius,
                      child: Image.asset('assets/images/dashboard.png')))),
        ],
      ),
    );
  }
}
