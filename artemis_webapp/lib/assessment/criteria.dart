import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class AssessmentCriteria extends StatelessWidget {
  //const AssessmentCriteria({super.key});
  final String title;
  final String score;
  final String scoreDescription;
  final Icon icon;
  //final Color iconColor;

  const AssessmentCriteria({
    super.key,
    required this.title,
    required this.score,
    required this.scoreDescription,
    required this.icon,
    //required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(40),
        width: MediaQuery.of(context).size.width * 0.184,
        height: 390 / 2 - 10,
        decoration: BoxDecoration(
          borderRadius: Decorations.borderRadius,
          color: AppColors.white,
          // border: Border.all(
          //   color: AppColors.greyAccentLine,
          // ),
          boxShadow: [
            Decorations.boxShadow,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.title1,
                ),
                Text(score, style: AppTextStyles.title1),
              ],
            ),
            Text(
              scoreDescription,
              style: AppTextStyles.subtitle2,
              textAlign: TextAlign.justify,
            ),
          ],
        ));
  }
}
