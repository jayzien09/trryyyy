import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(
            Icons.calendar_month,
            color: AppColors.black,
          ),
          onPressed: () {},
          // icon: SvgPicture.asset(
          //   'assets/calendar.svg',
          //   width: 20,
          // ),
          // onPressed: () {}
        ),
        const SizedBox(width: 10),
        IconButton(
            icon: const Icon(
              Icons.notifications,
              color: AppColors.black,
            ),
            onPressed: () {}),
        const SizedBox(width: 15),
        Row(children: const [
          CircleAvatar(
            radius: 17,
            backgroundImage: AssetImage('assets/images/Logo2.png'),
          ),
          Icon(Icons.arrow_drop_down_outlined, color: AppColors.black)
        ]),
        const SizedBox(width: 15),
      ],
    );
  }
}
