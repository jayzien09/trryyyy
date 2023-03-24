import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class TempWidget extends StatelessWidget {
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
  final Color tempBarTextColor;
  final Color tempBarColor;
  final int exceedValue;
  final Color tempExceedsColor;
  final Color tempBackgroundColor;

  const TempWidget({
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
    required this.tempBarTextColor,
    required this.tempBarColor,
    required this.exceedValue,
    required this.tempExceedsColor,
    required this.tempBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
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
              Text(description,
                  style: AppTextStyles.description
                      .copyWith(color: textColorDescription)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value.toString(),
                      style:
                          AppTextStyles.value.copyWith(color: textColorValue)),
                  Text('°',
                      style: AppTextStyles.unit.copyWith(color: textColorUnit)),
                ],
              ),
              SizedBox(
                  height: 170,
                  child: FAProgressBar(
                    currentValue: value,
                    maxValue: 100,
                    size: 50,
                    animatedDuration: const Duration(seconds: 2),
                    direction: Axis.vertical,
                    verticalDirection: VerticalDirection.up,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0.5,
                    ),
                    backgroundColor: tempBackgroundColor,
                    progressColor: tempBarColor,
                    changeColorValue: exceedValue,
                    changeProgressColor: tempExceedsColor,
                    displayText: '°C',
                    displayTextStyle: AppTextStyles.subtitle1.copyWith(
                      color: tempBarTextColor,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
