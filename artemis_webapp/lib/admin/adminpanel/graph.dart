import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: Decorations.borderRadius,
        boxShadow: [Decorations.boxShadow],
      ),
      height: (height / 1.94) / 1.5,
      width: width / 2.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analytics',
            style: AppTextStyles.title,
          ),
          Text(
            'subtitle',
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }
}
