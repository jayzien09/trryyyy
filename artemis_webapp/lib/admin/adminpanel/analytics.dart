import 'package:artemis_webapp/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnalyticsItems extends StatelessWidget {
  final Color containerColor;
  final String title;
  final int count;
  final Color textColorTitle;
  final Color textColorCount;
  final IconData icon;
  final Color iconColor;
  final String subtitle;
  final Color subtitleColor;

  AnalyticsItems({
    required this.containerColor,
    required this.title,
    required this.count,
    required this.textColorTitle,
    required this.textColorCount,
    required this.icon,
    required this.iconColor,
    required this.subtitle,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      //height: 100.0,
      width: MediaQuery.of(context).size.width / 7.25,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: Decorations.borderRadius,
        boxShadow: [Decorations.boxShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 15,
              ),
              Text(title,
                  style: AppTextStyles.title1.copyWith(color: textColorTitle)),
              Text(
                subtitle,
                style: AppTextStyles.body1.copyWith(color: subtitleColor),
              ),
            ],
          ),
          Container(
            height: 70,
            width: 1,
            color: AppColors.greyAccentLine,
          ),
          Text(count.toString(),
              style:
                  AppTextStyles.mainheadings.copyWith(color: textColorCount)),
        ],
      ),
    );
  }
}

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  bool hovered1 = false;
  bool hovered2 = false;
  bool hovered3 = false;
  bool hovered4 = false;

  Color hoverColorText = AppColors.white;
  Color initialColorContainer = AppColors.white;
  Color initialColorTitleIcon = AppColors.black;
  Color initialColorDescription = AppColors.grey;

  int userCount = 0;

  //get user count
  void getUserCount() async {
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('users').get();
    final List<DocumentSnapshot> documents = result.docs;
    setState(() {
      userCount = documents.length;
      print('userCount: $userCount');
    });
  }

  @override
  void initState() {
    super.initState();
    getUserCount();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      children: [
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered1 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered1 = false;
            });
          },
          child: AnalyticsItems(
            containerColor: hovered1 ? AppColors.blueAccent : AppColors.white,
            title: 'Users',
            count: userCount,
            textColorTitle: hovered1 ? AppColors.white : AppColors.black,
            textColorCount: hovered1 ? AppColors.white : AppColors.black,
            icon: Icons.accessibility_new_rounded,
            iconColor: hovered1 ? AppColors.white : AppColors.black,
            subtitle: 'Subtitle',
            subtitleColor: hovered1 ? AppColors.white : AppColors.grey,
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered2 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered2 = false;
            });
          },
          child: AnalyticsItems(
            containerColor: hovered2 ? AppColors.blueAccent : AppColors.white,
            title: 'Edge-Devices',
            count: userCount,
            textColorTitle: hovered2 ? AppColors.white : AppColors.black,
            textColorCount: hovered2 ? AppColors.white : AppColors.black,
            icon: Icons.memory_rounded,
            iconColor: hovered2 ? AppColors.white : AppColors.black,
            subtitle: 'Subtitle',
            subtitleColor: hovered2 ? AppColors.white : AppColors.grey,
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered3 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered3 = false;
            });
          },
          child: AnalyticsItems(
            containerColor: hovered3 ? AppColors.blueAccent : AppColors.white,
            title: 'Mails',
            count: userCount,
            textColorTitle: hovered3 ? AppColors.white : AppColors.black,
            textColorCount: hovered3 ? AppColors.white : AppColors.black,
            icon: Icons.markunread_rounded,
            iconColor: hovered3 ? AppColors.white : AppColors.black,
            subtitle: 'Subtitle',
            subtitleColor: hovered3 ? AppColors.white : AppColors.grey,
          ),
        ),
      ],
    );
  }
}
