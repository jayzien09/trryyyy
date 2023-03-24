import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class SignificanceWidget extends StatelessWidget {
  final String title;
  final String description;
  final Image image;
  SignificanceWidget({
    required this.title,
    required this.description,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(width: 40, height: 40, child: image),
          SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: AppTextStyles.headings,
          ),
          Text(
            description,
            style: AppTextStyles.subtitle,
          ),
        ],
      ),
    );
  }
}

class Significance extends StatefulWidget {
  const Significance({super.key});

  @override
  State<Significance> createState() => _SignificanceState();
}

class _SignificanceState extends State<Significance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('TITLE',
        //     style:
        //         AppTextStyles.headings1.copyWith(color: AppColors.blueAccent)),
        // Text('Grow your business with us', style: AppTextStyles.sublanding),
        Container(
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.symmetric(
          //   vertical: 50,horizontal: 170
          // ),
          child: Wrap(
            spacing: 20,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 30,
            children: [
              SignificanceWidget(
                //improves, sustain
                title: 'Contributes',
                description: 'to the reduction of\nenvironmental impacts',
                image: Image.asset('assets/icons/contributes.png',
                    fit: BoxFit.fitWidth),
              ),
              SignificanceWidget(
                  title: 'Yields',
                  description: 'bigger savings for the\ncompany ',
                  image: Image.asset('assets/icons/yields.png',
                      fit: BoxFit.fitWidth)),
              SignificanceWidget(
                  title: 'Protects',
                  description: 'against reputational\ndamage',
                  image: Image.asset('assets/icons/protects.png',
                      fit: BoxFit.fitWidth)),
              SignificanceWidget(
                  title: 'Develops',
                  description: 'new partnerships\nwith same ESG aspirations',
                  image: Image.asset('assets/icons/develops.png',
                      fit: BoxFit.fitWidth)),
              SignificanceWidget(
                  title: 'Win',
                  description: 'more business and\nachieve sustainability',
                  image: Image.asset('assets/icons/win.png',
                      fit: BoxFit.fitWidth)),
            ],
          ),
        ),
      ],
    );
  }
}
