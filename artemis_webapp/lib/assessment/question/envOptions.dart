// import 'package:artemis_webapp/config/responsive.dart';
// import 'package:artemis_webapp/constants.dart';
// import 'package:flutter/material.dart';

// class InfoCard extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final String status;
//   final int items;
//   final Color color;
//   final Color fontColor;
//   final Border border;
//   final BoxShadow boxShadow;
//   final bool visible;
//   final bool isSelected;

//   InfoCard(
//       {required this.icon,
//       required this.label,
//       required this.status,
//       required this.items,
//       required this.color,
//       required this.fontColor,
//       required this.border,
//       required this.boxShadow,
//       required this.visible,
//       required this.isSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Responsive.isDesktop(context)
//           ? MediaQuery.of(context).size.width / 7.8
//           : Responsive.isTablet(context)
//               ? MediaQuery.of(context).size.width * 0.31 - 30
//               : Responsive.isMobile(context)
//                   ? MediaQuery.of(context).size.width
//                   : MediaQuery.of(context).size.width * 0.3 - 6,
//       height: 150,
//       //IF DOUBLE CONTAINER
//       // padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
//       // decoration: BoxDecoration(
//       //   borderRadius: BorderRadius.circular(20),
//       //   color: color,
//       //   border: border, //Border.all(color: AppColors.greyAccent),
//       //   boxShadow: [boxShadow],
//       // ),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: color,
//           border: border, //Border.all(color: AppColors.greyAccent),
//           boxShadow: [boxShadow],
//         ),
//         // decoration: BoxDecoration(
//         //   borderRadius: BorderRadius.circular(20),
//         //   color: color,
//         //   border: border,
//         //   boxShadow: [boxShadow],
//         //   //   BoxShadow(
//         //   //     color: Color.fromARGB(31, 49, 49, 49),
//         //   //     blurRadius: 15,
//         //   //     offset: Offset(0, 5),
//         //   //   ),
//         // ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Radio(
//                 fillColor: MaterialStateProperty.resolveWith<Color>(
//                     (Set<MaterialState> states) {
//                   return (isSelected) ? AppColors.white : AppColors.black;
//                 }),
//                 value: "1",
//                 groupValue: "group value",
//                 activeColor: AppColors.blueAccent,
//                 onChanged: (value) {
//                   print(value); //selected value
//                 }),
//             SizedBox(
//               height: 10,
//             ),
//             Text(label,
//                 style: TextStyle(
//                     color: fontColor,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600)),
//           ],
//         ),
//       ),
//     );
//   }
// }
