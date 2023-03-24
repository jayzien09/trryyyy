import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Leaderboard', style: AppTextStyles.headings),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 45,
              //width: 600,
              decoration: BoxDecoration(
                color: AppColors.greyAccent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    height: 30,
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Supplier',
                          style: AppTextStyles.options,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(31, 49, 49, 49),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Manufacturing',
                          style: AppTextStyles.options.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    height: 30,
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Distribution',
                          style: AppTextStyles.options,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width / 15,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: Decorations.borderRadius,
                                boxShadow: [Decorations.boxShadow],
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.greyAccentLine,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Image(
                                        image: AssetImage(
                                          'assets/images/github.png',
                                        ),
                                        height: 40.0,
                                        width: 40.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text('Github',
                                      style: AppTextStyles.options.copyWith(
                                        fontWeight: FontWeight.w500,
                                      )),
                                  const Text('Score: 86%',
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 10,
                                      )),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10, left: 90),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: AppColors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text('2',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 13,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: Decorations.borderRadius,
                            boxShadow: [Decorations.boxShadow],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                //
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.greyAccentLine,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Image(
                                    image: AssetImage(
                                      'assets/images/Logo2.png',
                                    ),
                                    height: 40.0,
                                    width: 40.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text('Artemis', style: AppTextStyles.name),
                              const Text('Score: 94%',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.only(left: 110),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.yellow,
                              shape: BoxShape.circle,
                            ),
                            child: const Text('1',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width / 15,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: Decorations.borderRadius,
                            boxShadow: [Decorations.boxShadow],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.greyAccentLine,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Image(
                                    image: AssetImage(
                                      'assets/images/zinnovare.jpg',
                                    ),
                                    height: 40.0,
                                    width: 40.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text('Zinnovare',
                                  style: AppTextStyles.options.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                              const Text('Score: 82%',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 90),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.brownTelemetry,
                              shape: BoxShape.circle,
                            ),
                            child: const Text('3',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(top: 30),
              height: MediaQuery.of(context).size.height / 1.85,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(
              //   color: AppColors.white,
              //   borderRadius: Decorations.borderRadius,
              //   boxShadow: [Decorations.boxShadow],
              // ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Rank', style: AppTextStyles.options),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Company', style: AppTextStyles.options),
                      Spacer(),
                      Text('ESG Score', style: AppTextStyles.options),
                    ],
                  ),
                  const Divider(
                    color: AppColors.greyAccentLine,
                    thickness: 0.8,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.85 - 105,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No Available Data', style: AppTextStyles.tabs),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
