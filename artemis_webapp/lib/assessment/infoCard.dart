import 'package:artemis_webapp/assessment/question/environmental/envQuestionScreen.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class InfoCard extends StatelessWidget {
  final Icon icon;
  final String label;
  final String status;
  final int items;
  final Color color;
  final Color fontColor;
  final Border border;
  final BoxShadow boxShadow;
  final bool visible;
  final String navigation;
  final String date;

  InfoCard(
      {required this.icon,
      required this.label,
      required this.status,
      required this.items,
      required this.color,
      required this.fontColor,
      required this.border,
      required this.boxShadow,
      required this.visible,
      required this.navigation,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width * 0.184
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width * 0.31 - 30
              : Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.3 - 6,
      height: 235,
      //IF DOUBLE CONTAINER
      // padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20),
      //   color: color,
      //   border: border, //Border.all(color: AppColors.greyAccent),
      //   boxShadow: [boxShadow],
      // ),
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          border: border,
          boxShadow: [boxShadow],
          //   BoxShadow(
          //     color: Color.fromARGB(31, 49, 49, 49),
          //     blurRadius: 15,
          //     offset: Offset(0, 5),
          //   ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(items.toString(),
                      style: AppTextStyles.name.copyWith(
                          color: fontColor, fontWeight: FontWeight.w800)),
                  // Container(
                  //     padding: EdgeInsets.all(10),
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: AppColors.greyAccent,
                  //     ),
                  //     child: Image.asset(icon, width: 30)),
                  const SizedBox(width: 10),
                  Container(
                    width: 1,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(date,
                      style: AppTextStyles.name.copyWith(
                          color: fontColor, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text('Total Questions', style: AppTextStyles.subtitle3),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: AppColors.greyAccentLine,
              thickness: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(label,
                          style:
                              AppTextStyles.title.copyWith(color: fontColor)),
                      Icon(
                        icon.icon,
                        color: fontColor,
                        size: 15,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status,
                        style: AppTextStyles.subtitle3,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: visible,
                            child: TextButton(
                              onPressed: (() {
                                Navigator.pushNamed(context, '/' + navigation);
                              }),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 0, 13, 83)
                                        .withOpacity(0.9)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.blueAccent),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                elevation: MaterialStateProperty.all(5),
                                shadowColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(57, 49, 49, 49),
                                ),
                              ),
                              child: Text('Start Assessment',
                                  style: AppTextStyles.tabs
                                      .copyWith(color: AppColors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
