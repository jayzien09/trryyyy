import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class Criteria extends StatefulWidget {
  const Criteria({super.key});

  @override
  State<Criteria> createState() => _CriteriaState();
}

class _CriteriaState extends State<Criteria> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      // width: Responsive.isDesktop(context)
      //     ? (MediaQuery.of(context).size.width / 4.5)
      //     : Responsive.isMobile(context)
      //         ? MediaQuery.of(context).size.width
      //         : MediaQuery.of(context).size.width * 0.5,
      //height: 340,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Environmental', style: AppTextStyles.title),
                Text(
                  'Subtitle',
                  style: AppTextStyles.subHeadings,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 95,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          'Environmental criteria include a company’s use of renewable energy sources, its waste management program, how it handles potential problems of air or water pollution arising from its operations, deforestation issues (if applicable) and its overall environmental impact.',
                          style: AppTextStyles.subHeadings,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width / 4.5,
            color: AppColors.greyAccentLine,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width * 0.22 / 2 - 1,
                child: Column(
                  children: [
                    Text(
                      'Potential Gaps',
                      style: AppTextStyles.subHeadings,
                    ),
                    Text(
                      '2',
                      style: AppTextStyles.title,
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                width: 1,
                color: AppColors.greyAccentLine,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.22 / 2 - 1,
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(
                      'Recommendations',
                      style: AppTextStyles.subHeadings,
                    ),
                    Text(
                      '2',
                      style: AppTextStyles.title,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
