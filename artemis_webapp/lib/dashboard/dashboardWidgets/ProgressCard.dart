import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCard extends StatefulWidget {
  final Color color;
  final Color progressIndicatorColor;
  final String projectName;
  final String percentComplete;
  final IconData icon;
  final int percent;
  final String dateAssessed;
  //final Image image;

  ProgressCard({
    required this.color,
    required this.progressIndicatorColor,
    required this.percentComplete,
    required this.projectName,
    required this.icon,
    required this.percent,
    required this.dateAssessed,
    //required this.image,
  });
  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 275),
        height: hovered ? 185.0 : 175.0,
        padding: const EdgeInsets.all(30.0),
        //width: hovered ? 353 : 348, //345:340
        width: hovered
            ? Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width * 0.18 + 20
                : Responsive.isTablet(context)
                    ? MediaQuery.of(context).size.width * 0.31 - 30
                    : Responsive.isMobile(context)
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width * 0.3 - 6
            : Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width * 0.18
                : Responsive.isTablet(context)
                    ? MediaQuery.of(context).size.width * 0.31 - 40
                    : Responsive.isMobile(context)
                        ? MediaQuery.of(context).size.width - 10
                        : MediaQuery.of(context).size.width * 0.3 - 16,
        decoration: BoxDecoration(
            color: hovered ? widget.color : AppColors.white,
            borderRadius: Decorations.borderRadius,
            boxShadow: [Decorations.boxShadow]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: !hovered ? AppColors.black : AppColors.white,
                  size: 15.0,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  widget.projectName,
                  style: AppTextStyles.title1.copyWith(
                    color: hovered ? AppColors.white : AppColors.black,
                  ),
                ),
                Text(
                  widget.dateAssessed,
                  style: AppTextStyles.body1.copyWith(
                    color: hovered ? AppColors.white : AppColors.grey,
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: 1,
              color: AppColors.greyAccentLine,
            ),
            CircularPercentIndicator(
              radius: 35.0,
              lineWidth: 5.0,
              animation: true,
              percent: widget.percent / 100,
              center: Text(
                widget.percentComplete,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: hovered ? AppColors.white : AppColors.black),
              ),
              backgroundColor: hovered
                  ? AppColors.black.withOpacity(0.1)
                  : AppColors.greyAccent,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor:
                  hovered ? AppColors.white : widget.progressIndicatorColor,
            ),
          ],
        ),
      ),
    );
  }
}
