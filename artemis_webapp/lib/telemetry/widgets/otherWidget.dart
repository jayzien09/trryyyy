import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class OtherWidget extends StatelessWidget {
  final Color containerColor;
  final Color textColorTitle;
  final Color textColorDescription;
  final Color textColorValue;
  final Color textColorUnit;
  final String title;
  final String description;
  final double value;
  final String unit;
  final Icon icon;
  final double height;
  final double width;

  const OtherWidget({
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
    required this.icon,
    required this.height,
    required this.width,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              icon,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value.toString(),
                  style: AppTextStyles.value.copyWith(color: textColorValue)),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text(unit,
                      style: AppTextStyles.unit.copyWith(color: textColorUnit)),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: AppTextStyles.title1.copyWith(color: textColorTitle)),
              Text(description,
                  style: AppTextStyles.description
                      .copyWith(color: textColorDescription)),
            ],
          ),
        ],
      ),
    );
  }
}
