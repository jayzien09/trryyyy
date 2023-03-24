import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 170),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      color: Colors.amber,
      child: Column(
        children: [
          Container(
              height: (MediaQuery.of(context).size.height - 100) / 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.green),
          SizedBox(height: 49.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height - 100) / 2 - 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Image(
                              image: AssetImage('assets/images/Logo3.png'))),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                          'Artemis is a ESG assessment tool that '
                          'helps companies to assess their ESG performance and '
                          'identify areas for improvement.',
                          style: AppTextStyles.subtitle2),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('HELP', style: AppTextStyles.title),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Support', style: AppTextStyles.subtitle2),
                          Text('Support', style: AppTextStyles.subtitle2),
                          Text('Support', style: AppTextStyles.subtitle2),
                          Text('Support', style: AppTextStyles.subtitle2),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LINKS', style: AppTextStyles.title),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Video1', style: AppTextStyles.subtitle2),
                          Text('Video2', style: AppTextStyles.subtitle2),
                          Text('Video3', style: AppTextStyles.subtitle2),
                          Text('Video4', style: AppTextStyles.subtitle2),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: AppColors.greyAccentLine),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Copyright © 2022 Artemis. All rights reserved.',
                    style: AppTextStyles.subtitle2),
                Container(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Terms of Service', style: AppTextStyles.subtitle2),
                      Text('Privacy Policy', style: AppTextStyles.subtitle2),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
