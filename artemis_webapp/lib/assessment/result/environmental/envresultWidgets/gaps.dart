import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class Gaps extends StatelessWidget {
  const Gaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      // width: Responsive.isDesktop(context)
      //     ? (MediaQuery.of(context).size.width / 4.5)
      //     : Responsive.isMobile(context)
      //         ? MediaQuery.of(context).size.width
      //         : MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(6, 158, 158, 158).withOpacity(0.2),

            blurRadius: 30,
            //offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text('Potential Gaps', style: AppTextStyles.title),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width / 4.5,
            color: AppColors.greyAccentLine,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            height: 90,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: AppColors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Environmental Strategies',
                                style: AppTextStyles.title2,
                              ),
                              Text(
                                'subtitle',
                                style: AppTextStyles.subtitle3,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: AppColors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Environmental Policies',
                                style: AppTextStyles.title2,
                              ),
                              Text(
                                'subtitle',
                                style: AppTextStyles.subtitle3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
