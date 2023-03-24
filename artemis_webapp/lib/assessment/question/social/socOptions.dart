import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class SocInfoCard extends StatelessWidget {
  final String label;
  final Color btnColor;
  final Color color;
  final Color fontColor;
  final Border border;
  final BoxShadow boxShadow;

  SocInfoCard({
    required this.label,
    required this.btnColor,
    required this.color,
    required this.fontColor,
    required this.border,
    required this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width / 7.8
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width * 0.31 - 30
              : Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.3 - 6,
      height: 150,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          border: border, //Border.all(color: AppColors.greyAccent),
          boxShadow: [boxShadow],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 12,
              height: 12,
              child: Stack(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: fontColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: btnColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(label, style: AppTextStyles.name.copyWith(color: fontColor)),
          ],
        ),
      ),
    );
  }
}
