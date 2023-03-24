import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class HowItWorksLeftCard extends StatelessWidget {
  //const HowItWorksLeftCard({super.key});

  final String title;
  final String description;

  const HowItWorksLeftCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title),
        Text(description, style: AppTextStyles.subtitle),
      ],
    );
  }
}

class HowItWorksLeft extends StatefulWidget {
  const HowItWorksLeft({super.key});

  @override
  State<HowItWorksLeft> createState() => _HowItWorksLeftState();
}

class _HowItWorksLeftState extends State<HowItWorksLeft> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.52,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.52 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HowItWorksLeftCard(
                  title: '7+ Onboard Sensors',
                  description:
                      'Smart sensors to track various supply chain emissions',
                ),
                HowItWorksLeftCard(
                  title: '20+ Hours Battery',
                  description: 'Uninterrupted sensing while power is down',
                ),
                HowItWorksLeftCard(
                  title: 'Real-Time Cloud Database',
                  description:
                      'Access up-to-date telemetry anytime and anywhere',
                ),
              ],
            ),
          ),
          const HowItWorksLeftCard(
            title: 'Sleek, Modern, and Compact',
            description:
                'Its design brings a beautiful yet unobtrusive design to every place it touches',
          ),
        ],
      ),
    );
  }
}

class HowItWorksRight extends StatelessWidget {
  const HowItWorksRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.27,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Meet ARTEMIS',
              style: AppTextStyles.sublanding
                  .copyWith(color: AppColors.blueAccent)),
          Text('Enviro-Tracker', style: AppTextStyles.landing2),
          SizedBox(
            height: 30.0,
          ),
          Text(
              'Access up-to-date telemetry anytime and anywhere. Lorem Ipsum Ipsum ola chikadora this is a description for artemis device, hello its me again. Access up-to-date telemetry anytime and anywhere. Lorem Ipsum Ipsum ola chikadora this is a description for artemis device.',
              style: AppTextStyles.subtitle),
        ],
      ),
    );
  }
}
