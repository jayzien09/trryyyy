import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

import 'dashboardReading.dart';

class DashboardDetails extends StatefulWidget {
  const DashboardDetails({super.key});

  @override
  State<DashboardDetails> createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            //margin: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: Decorations.borderRadius,
                boxShadow: [Decorations.boxShadow]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Partnered Companies',
                  style: AppTextStyles.title,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Meet your partners and see their \nranks to get the best results',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.greyAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Image(
                            image:
                                AssetImage('assets/images/ArtemisLogoOnly.png'),
                            height: 40.0,
                            width: 40.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'ARTEMIS',
                          style: AppTextStyles.body1,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.greyAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Image(
                            image:
                                AssetImage('assets/images/ArtemisLogoOnly.png'),
                            height: 40.0,
                            width: 40.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'ARTEMIS',
                          style: AppTextStyles.body1,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.greyAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_forward,
                              color: AppColors.black),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'View All',
                          style: AppTextStyles.body1,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.505,
              width: MediaQuery.of(context).size.width,
              //margin: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: Decorations.borderRadius,
                  boxShadow: [Decorations.boxShadow]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 30.0, left: 30, right: 30, bottom: 20),
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.greyAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              height: 25,
                              width: 90,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(31, 49, 49, 49),
                                    blurRadius: 15,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Recent',
                                    style: AppTextStyles.body2
                                        .copyWith(fontWeight: FontWeight.w800),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(Icons.arrow_upward_rounded,
                                      size: 15, color: Colors.green),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              height: 25,
                              width: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Last',
                                    style: AppTextStyles.body2
                                        .copyWith(fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.arrow_downward_rounded,
                                    size: 15,
                                    color: AppColors.red,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromARGB(255, 221, 221, 221),
                            width: 1,
                          ),
                        ),
                        child: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      height: MediaQuery.of(context).size.height * 0.515 - 100,
                      child: const SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DashboardReading())),
                ],
              ))
        ],
      ),
    );
  }
}
