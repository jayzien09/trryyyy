import 'package:artemis_webapp/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SocialWidget extends StatefulWidget {
  //const SocialWidget({super.key});
  final snap;

  // final String companyName;
  // final String companyLogo;
  // final String companyScore;
  // final String companyIndustry;
  // final String companyRank;
  // final double companyPercent;

  const SocialWidget({
    super.key,
    required this.snap,
    // required this.companyName,
    // required this.companyLogo,
    // required this.companyScore,
    // required this.companyIndustry,
    // required this.companyRank,
    // required this.companyPercent,
  });

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  bool onHover = false;

  String descriptiveScore = "";

  // scoreCheck() {
  //   //to double
  //   double score = double.parse(widget.snap['esgScore']);

  //   if (widget.snap['esgScore'] < 25) {
  //     setState(() {
  //       descriptiveScore = "Poor";
  //     });
  //   } else if (50 < widget.snap['esgScore'] && widget.snap['esgScore'] > 25) {
  //     setState(() {
  //       descriptiveScore = "Fair";
  //     });
  //   } else if (75 < widget.snap['esgScore'] && widget.snap['esgScore'] > 50) {
  //     setState(() {
  //       descriptiveScore = "Good";
  //     });
  //   } else if (100 < widget.snap['esgScore'] && widget.snap['esgScore'] > 75) {
  //     setState(() {
  //       descriptiveScore = "Excellent";
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   scoreCheck();
  // }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          onHover = true;
        });
      },
      onExit: (value) {
        setState(() {
          onHover = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5.435,
        height: 380,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: Decorations.borderRadius,
          boxShadow: [Decorations.boxShadow],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.star_rounded, color: AppColors.yellow, size: 20),
                  ],
                ),
                const Icon(Icons.more_vert, color: AppColors.grey, size: 20),
              ],
            ),
            //const SizedBox(height: 20),
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.greyAccentLine,
                    width: 1,
                  )),
              child: ClipRRect(
                //borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: AssetImage(
                    //widget.snap['companyLogo'],
                    'assets/images/Logo1.png',
                  ),
                  fit: BoxFit.scaleDown,
                ),
                // child: Image.network(
                //   widget.snap['imageUrl'].toString(),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.snap['companyName'],
                style: AppTextStyles.title.copyWith()),
            const SizedBox(height: 5),
            Text(widget.snap['companyIndustry'],
                style: AppTextStyles.subtitle.copyWith()),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: onHover
                  ? Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextButton(
                        onPressed: (() {}),
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 0, 13, 83)
                                  .withOpacity(0.9)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.blueAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(5),
                          shadowColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(57, 49, 49, 49),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.person_rounded,
                                color: AppColors.white, size: 20),
                            SizedBox(width: 10),
                            Text('View Profile',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ESG Score: ',
                                style: AppTextStyles.subtitle.copyWith()),
                            Text(widget.snap['descriptiveScore'].toString(),
                                style: AppTextStyles.subtitle
                                    .copyWith(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.leaderboard_rounded,
                        color: AppColors.grey, size: 20),
                    const SizedBox(width: 10),
                    Text(widget.snap['companyRank'],
                        style: AppTextStyles.subtitle),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 2,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.greyAccentLine,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.connect_without_contact,
                        color: AppColors.grey, size: 20),
                    const SizedBox(width: 10),
                    Text('Connect', style: AppTextStyles.subtitle),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
