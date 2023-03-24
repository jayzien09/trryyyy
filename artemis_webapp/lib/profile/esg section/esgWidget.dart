import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class ESGScore extends StatelessWidget {
  //const ESGScore({super.key});

  final int score;
  final String esg;
  final Icon icon;

  const ESGScore({
    super.key,
    required this.score,
    required this.esg,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width / 9.78,
      height: (MediaQuery.of(context).size.height / 1.94) / 3.8,
      decoration: BoxDecoration(
        borderRadius: Decorations.borderRadius,
        color: AppColors.white,
        boxShadow: [
          Decorations.boxShadow,
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                icon,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(esg,
                    style: AppTextStyles.body.copyWith(color: AppColors.grey)),
                Text('$score%',
                    style: AppTextStyles.esgScore
                        .copyWith(color: AppColors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
