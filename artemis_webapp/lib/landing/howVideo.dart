import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/landing/howItWorks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VideoPreview extends StatelessWidget {
  const VideoPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.16,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greyAccentLine, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}

class HowVideo extends StatelessWidget {
  const HowVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3 - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Headings',
                    style: AppTextStyles.landing
                        .copyWith(color: AppColors.blueAccent)),
                HowItWorksLeftCard(
                  title: 'Title Heading or smth',
                  description:
                      'Lorem Ipsum Ipsum ola chikadora this is a description for artemis device, hello its me again. Access up-to-date telemetry anytime and anywhere. Lorem Ipsum Ipsum ola chikadora this is a description for artemis device.',
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 70,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.1),
                          blurRadius: 25.0,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('01', style: AppTextStyles.headings),
                          SizedBox(width: 30),
                          Text('Description Here Description Here',
                              style: AppTextStyles.tabs),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: AppColors.greyAccentLine, size: 20)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 70,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey.withOpacity(0.1),
                            blurRadius: 20.0,
                            spreadRadius: 5.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('02', style: AppTextStyles.headings),
                          SizedBox(width: 30),
                          Text('Description Here Description Here',
                              style: AppTextStyles.tabs),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: AppColors.greyAccentLine, size: 20)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 70,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey.withOpacity(0.1),
                            blurRadius: 20.0,
                            spreadRadius: 5.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('02', style: AppTextStyles.headings),
                          SizedBox(width: 30),
                          Text('Description Here Description Here',
                              style: AppTextStyles.tabs),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: AppColors.greyAccentLine, size: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
