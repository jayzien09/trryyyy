import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class AdminTools extends StatefulWidget {
  const AdminTools({super.key});

  @override
  State<AdminTools> createState() => _AdminToolsState();
}

class _AdminToolsState extends State<AdminTools> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: Decorations.borderRadius,
          boxShadow: [Decorations.boxShadow],
        ),
        height: height / 2.15,
        width: width / 3.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin Tools',
              style: AppTextStyles.title,
            ),
            Text(
              'subtitle',
              style: AppTextStyles.body,
            ),
          ],
        ));
  }
}
