import 'package:artemis_webapp/assessment/criteria.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CriteriaItems extends StatefulWidget {
  const CriteriaItems({super.key});

  @override
  State<CriteriaItems> createState() => _CriteriaItemsState();
}

class _CriteriaItemsState extends State<CriteriaItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.start,
          children: const [
            AssessmentCriteria(
              title: 'Poor',
              score: '0 to 24',
              scoreDescription:
                  'Poor relative ESG performance and insufficient degree of transparency in reporting material ESG data publicly.',
              icon: Icon(Icons.error_outline_rounded, color: AppColors.red),
              //iconColor: AppColors.red
            ),
            AssessmentCriteria(
              title: 'Satisfactory',
              score: '25 to 49',
              scoreDescription:
                  'Satisfactory relative ESG performance and moderate degree of transparency in reporting material ESG data publicly.',
              icon: Icon(Icons.check, color: AppColors.yellow),
              //iconColor: AppColors.yellow
            ),
            AssessmentCriteria(
              title: 'Good',
              score: '50 to 74',
              scoreDescription:
                  'Good relative ESG performance and above average degree of transparency in reporting material ESG data publicly.',
              icon:
                  Icon(Icons.favorite_outline_rounded, color: AppColors.green),
              //iconColor: AppColors.green
            ),
            AssessmentCriteria(
              title: 'Excellent',
              score: '75 to 100',
              scoreDescription:
                  'Excellent relative ESG performance and high degree of transparency in reporting material ESG data publicly.',
              icon: Icon(Icons.star_border_rounded, color: AppColors.blue),
              //iconColor: AppColors.blue
            ),
          ],
        ),
      ],
    );
  }
}
