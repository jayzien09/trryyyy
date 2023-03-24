import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const white = Colors.white;
  static const grey = Colors.grey;
  static const black = Color(0xFF404040);
  static const red = Color(0xFFE57965);
  static const green = Colors.green;
  static const blue = Color(0xFF4A90E2);
  static const yellow = Colors.amber;
  static const orange = Colors.orange;
  static const redBright = Colors.red;

  static const greenTelemetry = Color(0xFF54A73F);
  static const purpleTelemetry = Colors.purple;
  static const redTelemetry = Color(0xFFE57965);
  static const yellowTelemetry = Color(0xFFF2C94C);
  static const blueTelemetry = Color(0xFF4A90E2);
  static const orangeTelemetry = Color(0xFFF2994A);
  static const bluegreenTelemetry = Color(0xFF15C0B7);
  static const pinkTelemetry = Color(0xFFE75A7C);
  static const brownTelemetry = Color(0xFFA37F5F);

  static const lightred = Color(0xFFFFE7E4);
  static const lightgreen = Color(0xFFE7F4E4);
  static const lightyellow = Color(0xFFFFF4E4);
  static const lightblue = Color(0xFFE7F0FF);
  static const blueAccent = Color(0xFF1930AA);
  static const greyAccent = Color(0xffF0F0F0);
  static const greyAccentLine = Color.fromARGB(255, 221, 221, 221);
}

class Decorations {
  static BorderRadius borderRadius = const BorderRadius.all(
    Radius.circular(15),
  );
  static BoxShadow boxShadow = BoxShadow(
    blurRadius: 20,
    color: AppColors.grey.withOpacity(0.1), //can be 0.2
  );
}

class DashboardTextStyles {}

//font style
class AppTextStyles {
  //HEADER
  // static const TextStyle headings = TextStyle(
  //   color: AppColors.black,
  //   fontSize: 30,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: 'Poppins',
  // );
  static TextStyle mainheadings = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headings = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subHeadings = GoogleFonts.quicksand(
    color: AppColors.grey,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  //DASHBOARD
  //Dashboard Main
  static TextStyle score = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 120,
    fontWeight: FontWeight.w600,
  );
  // static const TextStyle title = TextStyle(
  //   color: AppColors.black,
  //   fontSize: 20,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: 'Poppins',
  // );
  static TextStyle title = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subtitle = GoogleFonts.quicksand(
    color: AppColors.grey,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  //Progress Card
  // static const TextStyle label = TextStyle(
  //   color: AppColors.black,
  //   fontSize: 15,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: 'Poppins',
  // );
  static TextStyle label = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  //Dashboard details
  static TextStyle body = GoogleFonts.quicksand(
    color: AppColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  // static const TextStyle body1 = TextStyle(
  //   //progress card, line chart
  //   color: AppColors.black,
  //   fontSize: 10,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: 'Poppins',
  // );
  static TextStyle body1 = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body2 = GoogleFonts.quicksand(
    //device reading
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );

  //TELEMETRY
  static const TextStyle value = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w700,
  );
  // static const TextStyle unit = TextStyle(
  //   fontSize: 20,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: 'Poppins',
  // );
  static TextStyle unit = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  // static const TextStyle title1 = TextStyle(
  //   fontSize: 18,
  //   fontFamily: 'Poppins',
  //   fontWeight: FontWeight.w300,
  // );
  static TextStyle title1 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle description = GoogleFonts.quicksand(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subtitle1 = GoogleFonts.quicksand(
    fontSize: 9,
    fontWeight: FontWeight.w500,
  );

  //SOCIAL
  // static const TextStyle options = TextStyle(
  //   color: AppColors.black,
  //   fontSize: 12,
  //   fontFamily: 'Poppins',
  // );
  static TextStyle options = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 12,
  );
  // static const TextStyle tags = TextStyle(
  //   color: AppColors.black,
  //   fontSize: 10,
  //   fontFamily: 'Poppins',
  // );
  static TextStyle tags = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 10,
  );

  static TextStyle name = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  //ASSESSEMENT
  static TextStyle tabs = GoogleFonts.poppins(
    color: AppColors.grey,
    fontSize: 15,
  );
  static TextStyle subtitle3 = GoogleFonts.quicksand(
    color: AppColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  //PROFILE
  static TextStyle details = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle detailsValue = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle overviewDetails = GoogleFonts.quicksand(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static TextStyle esgScore = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headings1 = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle esgScore1 = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w800,
  );

  static TextStyle title2 = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 15,
  );

  static TextStyle title2Quicksand = GoogleFonts.quicksand(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  //
  static TextStyle tabs1 = GoogleFonts.quicksand(
    color: AppColors.black,
    fontSize: 15,
  );

  static TextStyle landing = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 60,
    fontWeight: FontWeight.w600,
  );
  static TextStyle sublanding = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );
  static TextStyle landing1 = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 130,
    fontWeight: FontWeight.w600,
  );
  static TextStyle landing2 = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 68,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitle2 = GoogleFonts.quicksand(
    color: AppColors.grey,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
}
