import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text('ABOUT',
                style: AppTextStyles.headings1
                    .copyWith(color: AppColors.blueAccent)),
            Text('See more about our team!', style: AppTextStyles.sublanding),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. ',
                  style: AppTextStyles.name.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
