import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScoreGraph extends StatefulWidget {
  const ScoreGraph({super.key});

  @override
  State<ScoreGraph> createState() => _ScoreGraphState();
}

class _ScoreGraphState extends State<ScoreGraph> {
  int quesScore = 96;
  int senseScore = 92;
  int envScore = 94;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      // width: Responsive.isDesktop(context)
      //     ? (MediaQuery.of(context).size.width / 2.95)
      //     : Responsive.isMobile(context)
      //         ? MediaQuery.of(context).size.width
      //         : MediaQuery.of(context).size.width * 0.5,
      //height: 340,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: Decorations.borderRadius,
        boxShadow: [Decorations.boxShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Environmental',
                    style: AppTextStyles.headings1,
                  ),
                  Text(
                    'Report',
                    style: AppTextStyles.title,
                  ),
                ],
              ),
              Text('$envScore%',
                  style: AppTextStyles.value.copyWith(color: AppColors.green)),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc ut aliquam tincidunt, nunc nunc aliquam lorem, eu aliquam nunc nisl sit amet nunc. Sed euismod, nunc ut aliquam tincidunt, nunc nunc aliquam lorem, eu aliquam nunc nisl sit amet nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc ut aliquam tincidunt, nunc nunc aliquam lorem, eu aliquam nunc nisl sit amet nunc. Sed euismod, nunc ut aliquam tincidunt, nunc nunc aliquam lorem, eu aliquam nunc nisl sit amet nunc.',
                      style: AppTextStyles.subtitle),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 70.0,
                    lineWidth: 15.0,
                    animation: true,
                    percent: quesScore / 100,
                    center: Text(
                      quesScore.toString(),
                      style: AppTextStyles.headings,
                    ),
                    backgroundColor: AppColors.greyAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: AppColors.blueTelemetry,
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: AppColors.blueTelemetry,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Question-based',
                        style: AppTextStyles.subtitle3,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 1,
                height: 200,
                color: AppColors.greyAccentLine,
              ),
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 70.0,
                    lineWidth: 15.0,
                    animation: true,
                    percent: senseScore / 100,
                    center: Text(
                      senseScore.toString(),
                      style: AppTextStyles.headings,
                    ),
                    backgroundColor: AppColors.greyAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: AppColors.red,
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Sensor Reading',
                        style: AppTextStyles.subtitle3,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
