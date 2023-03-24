import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  //const HeaderAssessment({super.key});

  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;

  Header({
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: AppTextStyles.headings
                  //FOR RESPONSIVE FONT STYLING
                  // .copyWith(
                  //     color: AppColors.black,
                  //     fontSize: Responsive.isMobile(context) ? 20 : 30)
                  ),
              Row(
                children: [
                  Text(
                    subtitle1,
                    style: AppTextStyles.subHeadings,
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Center(
                    child: Text(
                      subtitle2,
                      style: AppTextStyles.subHeadings,
                    ),
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Text(
                    subtitle3,
                    style: AppTextStyles.subHeadings,
                  ),
                ],
              ),
            ]),
          ),
        ]),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
