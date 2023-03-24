import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class FeatureCardLeft extends StatelessWidget {
  //const Features({super.key});

  final String title;
  final String description;
  final String image;

  FeatureCardLeft({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.13,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.headings),
                Text(description, style: AppTextStyles.subtitle),
              ],
            ),
          ),
          Container(child: Image.asset(image)),
        ],
      ),
    );
  }
}

class FeatureCardRight extends StatelessWidget {
  //const Features({super.key});

  final String title;
  final String description;
  final String image;

  FeatureCardRight({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(child: Image.asset(image)),
          Container(
            width: MediaQuery.of(context).size.width * 0.13,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.headings),
                Text(description, style: AppTextStyles.subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturesLeft extends StatefulWidget {
  const FeaturesLeft({super.key});

  @override
  State<FeaturesLeft> createState() => _FeaturesLeftState();
}

class _FeaturesLeftState extends State<FeaturesLeft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureCardLeft(
            title: 'Determine',
            description:
                'whether the partners or vendors conduct ESG practices',
            image: 'assets/icons/determine.png',
          ),
          FeatureCardLeft(
            title: 'Compare',
            description: 'the ESG performance of the partners or vendors',
            image: 'assets/icons/compare.png',
          ),
          FeatureCardLeft(
            title: 'Identify',
            description:
                'partners or vendors who have excellent ESG performance rating',
            image: 'assets/icons/identify.png',
          ),
        ],
      ),
    );
  }
}

class FeaturesRight extends StatefulWidget {
  const FeaturesRight({super.key});

  @override
  State<FeaturesRight> createState() => _FeaturesRightState();
}

class _FeaturesRightState extends State<FeaturesRight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureCardRight(
            title: 'Provide',
            description: 'summary reports for the partners ESG assessments',
            image: 'assets/icons/provide.png',
          ),
          FeatureCardRight(
            title: 'Pinpoint',
            description: 'potential gaps across all ESG areas',
            image: 'assets/icons/pinpoint.png',
          ),
          FeatureCardRight(
            title: 'Assist',
            description:
                'partners and companies to make better informed decisions',
            image: 'assets/icons/assist.png',
          ),
        ],
      ),
    );
  }
}
