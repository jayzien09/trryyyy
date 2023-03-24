import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreenLeft extends StatefulWidget {
  const SignUpScreenLeft({super.key});

  @override
  State<SignUpScreenLeft> createState() => _SignUpScreenLeftState();
}

class _SignUpScreenLeftState extends State<SignUpScreenLeft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.blueAccent,
        //borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(50),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.5 - 40,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 400,
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  left: 150,
                  child: Transform(
                    transform: Matrix4.rotationZ(3.8),
                    child: Icon(
                      Icons.close_rounded,
                      size: 15,
                      color: AppColors.lightblue.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 00,
                  left: 120,
                  child: Transform(
                    transform: Matrix4.rotationZ(2.8),
                    child: Icon(
                      Icons.close_rounded,
                      size: 25,
                      color: AppColors.lightblue.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 120,
                  child: Transform(
                    transform: Matrix4.rotationZ(2.8),
                    child: Icon(
                      Icons.close_rounded,
                      size: 25,
                      color: AppColors.lightblue.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 120,
                  child: Transform(
                    transform: Matrix4.rotationZ(2),
                    child: Icon(
                      Icons.close_rounded,
                      size: 15,
                      color: AppColors.lightblue.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 80,
                  child: Transform(
                    transform: Matrix4.rotationZ(2),
                    child: Icon(
                      Icons.close_rounded,
                      size: 30,
                      color: AppColors.lightblue.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 50,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.lightblue.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 80,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.lightblue.withOpacity(0.1),
                        width: 1,
                      ),
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  right: 20,
                  child: Transform(
                    transform: Matrix4.rotationZ(2.3),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.lightblue.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 180,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                            image: AssetImage('assets/images/results.png'))),
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          Image(image: AssetImage('assets/images/stats1.png')),
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.06,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                            image: AssetImage('assets/images/telemetry2.png'))),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Text(
                  'Artemis ESG Management Tool',
                  style: AppTextStyles.headings.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Description of the tool. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam lacinia, nunc nisl aliquam nisl, ',
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 30,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
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
