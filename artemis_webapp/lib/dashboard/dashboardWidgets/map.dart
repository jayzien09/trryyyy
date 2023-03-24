import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class Partners extends StatelessWidget {
  const Partners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(30),
      height: 280,
      width: MediaQuery.of(context).size.width * 0.432,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: Decorations.borderRadius,
        boxShadow: [
          Decorations.boxShadow,
        ],
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 280,
            width: MediaQuery.of(context).size.width * 0.432,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage(
                  'assets/images/map1.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30, left: 30),
              padding:
                  const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
              height: 35,
              width: 225,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyAccent.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Partnered Businesses',
                      style: AppTextStyles.title2Quicksand
                          .copyWith(color: AppColors.blueAccent),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(top: 150, right: 90),
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.blueAccent.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.blueAccent,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.assistant_rounded,
                    color: AppColors.blueAccent,
                    size: 50,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 60, left: 100),
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.blueAccent.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.blueAccent,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 500),
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.blueAccent.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.blueAccent,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
