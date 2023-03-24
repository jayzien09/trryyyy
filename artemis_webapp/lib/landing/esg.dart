import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class InfoPalette extends StatelessWidget {
  final String title;
  final String text;
  //final IconData icon;
  final String icon;
  InfoPalette({
    required this.text,
    required this.title,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/icons/$icon.png')),
          // Icon(
          //   icon,
          //   size: 30,
          // ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: AppTextStyles.headings,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class ESG extends StatefulWidget {
  const ESG({super.key});

  @override
  State<ESG> createState() => _ESGState();
}

class _ESGState extends State<ESG> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoPalette(
              title: 'Environmental',
              text:
                  'Communicate with colleagues, share ideas, find a team in a project in one space.',
              icon: 'contributes' //Icons.eco_rounded,
              ),
          InfoPalette(
              title: 'Social',
              text:
                  'Track your progress thanks to the reporting system right inside the platform.',
              icon: 'provide' //Icons.groups_rounded,
              ),
          InfoPalette(
              title: 'Governance',
              text:
                  'Manage your projects and tasks by tracking activity on the dashboard.',
              icon: 'determine' //Icons.account_balance_rounded,
              ),
        ],
      ),
    );
  }
}
