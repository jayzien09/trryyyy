import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class LeftSection extends StatelessWidget {
  const LeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.54,
      //color: Colors.grey,
      child: Stack(
        children: [
          Positioned(
            bottom: 80,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.23,
              height: MediaQuery.of(context).size.height * 0.23,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                  'assets/images/mockups/telMock.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.27,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                  'assets/images/telemetry3.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightSection extends StatelessWidget {
  const RightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.6,
      // /color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 1,
                color: AppColors.blueAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'WE ARE ARTEMIS',
                style: AppTextStyles.name.copyWith(
                  color: AppColors.blueAccent,
                ),
              ),
            ],
          ),
          Text('We bring your business to path of sustainability.',
              style: AppTextStyles.landing),
          SizedBox(
            height: 30,
          ),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: AppTextStyles.tabs),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (() {}),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.blueAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Contact Us',
                        style: AppTextStyles.name
                            .copyWith(color: AppColors.white)),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (() {}),
                  child: Text(
                    'Learn More  >',
                    style: AppTextStyles.name,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
