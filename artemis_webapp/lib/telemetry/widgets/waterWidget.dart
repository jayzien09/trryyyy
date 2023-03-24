import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterWidget extends StatelessWidget {
  final Color containerColor;
  final Color textColorTitle;
  final Color textColorDescription;
  final Color textColorValue;
  final Color textColorUnit;
  final String title;
  final String description;
  final double value;
  final String unit;
  final double height;
  final double width;
  final Color liquidColor;
  final Color liquidColorBackground;
  final String liquidValue;
  final Color liquidValueColor;

  const WaterWidget({
    super.key,
    required this.containerColor,
    required this.textColorTitle,
    required this.textColorDescription,
    required this.textColorValue,
    required this.textColorUnit,
    required this.title,
    required this.description,
    required this.value,
    required this.unit,
    required this.height,
    required this.width,
    required this.liquidColor,
    required this.liquidColorBackground,
    required this.liquidValue,
    required this.liquidValueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: Decorations.borderRadius,
        boxShadow: [Decorations.boxShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: AppTextStyles.title1.copyWith(color: textColorTitle)),
              Text(
                description,
                style: AppTextStyles.description
                    .copyWith(color: textColorDescription),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(value.toString(),
                      style:
                          AppTextStyles.value.copyWith(color: textColorValue)),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Text(unit,
                          style: AppTextStyles.unit.copyWith(
                            color: textColorUnit,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 280,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: LiquidLinearProgressIndicator(
              value: 0.5,
              backgroundColor: liquidColorBackground,
              borderColor: Colors.transparent,
              borderWidth: 5.0,
              borderRadius: 5,
              center: Text(
                liquidValue,
                style:
                    AppTextStyles.description.copyWith(color: liquidValueColor),
              ),
              valueColor: AlwaysStoppedAnimation(liquidColor),
            ),
          ),
        ],
      ),
    );
  }
}
