import 'package:artemis_webapp/assessment/assessmentScreen.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AssessmentTabs extends StatefulWidget {
  const AssessmentTabs({super.key});

  @override
  State<AssessmentTabs> createState() => _AssessmentTabsState();
}

class _AssessmentTabsState extends State<AssessmentTabs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Column(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: const Duration(milliseconds: 1),
                                child: const AssessmentScreen()));
                      },
                      child: Text(
                        'Assessment',
                        style: AppTextStyles.tabs.copyWith(
                            color: AppColors.blueAccent,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 5.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                      color: AppColors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 50.0,
              ),
              Column(
                children: [
                  Text(
                    'Reports',
                    style: AppTextStyles.tabs,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Container(
                  //   height: 5.0,
                  //   width: 100.0,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.blueAccent,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(20.0),
                  //       topRight: Radius.circular(20.0),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                width: 50.0,
              ),
              Column(
                children: [
                  Text(
                    'Summary',
                    style: AppTextStyles.tabs,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Container(
                  //   height: 5.0,
                  //   width: 100.0,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.blueAccent,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(20.0),
                  //       topRight: Radius.circular(20.0),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          width: MediaQuery.of(context).size.width,
          color: AppColors.grey,
        )
      ],
    );
  }
}
