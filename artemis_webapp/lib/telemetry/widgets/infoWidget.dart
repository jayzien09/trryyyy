import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final Color containerColor;
  final String title;
  final Color textColorTitle;
  final String description;
  final Color textColorDescription;
  final double height;
  final double width;

  const InfoWidget({
    Key? key,
    required this.containerColor,
    required this.title,
    required this.textColorTitle,
    required this.description,
    required this.textColorDescription,
    required this.height,
    required this.width,
  }) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.info_outline_rounded, color: textColorTitle, size: 30),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title,
              style: AppTextStyles.title1.copyWith(color: textColorTitle)),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style:
                AppTextStyles.description.copyWith(color: textColorDescription),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
