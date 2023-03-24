// import 'package:artemis_webapp/config/responsive.dart';
// import 'package:artemis_webapp/constants.dart';
// import 'package:flutter/material.dart';

// class Header extends StatelessWidget {
//   const Header({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisSize: MainAxisSize.min, children: [
//       SizedBox(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text('Welcome To Your Dashboard',
//                   style: TextStyle(
//                       color: AppColors.black,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold)),
//               Text('Company Name',
//                   style: TextStyle(
//                     color: AppColors.black,
//                     fontSize: 15,
//                   )),
//             ]),
//       ),
//       const Spacer(
//         flex: 1,
//       ),
//       Expanded(
//         flex: Responsive.isDesktop(context) ? 1 : 3,
//         child: TextField(
//           decoration: InputDecoration(
//               filled: true,
//               fillColor: AppColors.white,
//               contentPadding: const EdgeInsets.only(left: 40.0, right: 5),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: const BorderSide(color: AppColors.white),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: const BorderSide(color: AppColors.white),
//               ),
//               prefixIcon: const Icon(Icons.search, color: AppColors.black),
//               hintText: 'Search',
//               hintStyle: const TextStyle(color: AppColors.grey, fontSize: 14)),
//         ),
//       ),
//     ]);
//   }
// }


// // import 'package:artemis_webapp/config/responsive.dart';
// // import 'package:artemis_webapp/constants.dart';
// // import 'package:flutter/material.dart';

// // class Header extends StatelessWidget {
// //   //const HeaderAssessment({super.key});

// //   final String title;
// //   final String subtitle1;
// //   final String subtitle2;
// //   final String subtitle3;

// //   Header({
// //     required this.title,
// //     required this.subtitle1,
// //     required this.subtitle2,
// //     required this.subtitle3,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Row(mainAxisSize: MainAxisSize.min, children: [
// //           SizedBox(
// //             child:
// //                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //               Text(title,
// //                   style: const TextStyle(
// //                       color: AppColors.black,
// //                       fontSize: 30,
// //                       fontWeight: FontWeight.bold)),
// //               // Text('Company Name',
// //               //     style: TextStyle(
// //               //       color: AppColors.black,
// //               //       fontSize: 15,
// //               //     )),
// //               const SizedBox(height: 10),
// //               Row(
// //                 children: [
// //                   Text(
// //                     subtitle1,
// //                     style: TextStyle(
// //                       fontSize: 12.0,
// //                       color: AppColors.grey,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 7.0,
// //                   ),
// //                   Center(
// //                     child: Text(
// //                       subtitle2,
// //                       style: TextStyle(
// //                         fontSize: 12.0,
// //                         color: AppColors.grey,
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 7.0,
// //                   ),
// //                   Text(
// //                     subtitle3,
// //                     style: TextStyle(
// //                       fontSize: 12.0,
// //                       color: AppColors.grey,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ]),
// //           ),
// //           const Spacer(
// //             flex: 1,
// //           ),
// //           Expanded(
// //             flex: Responsive.isDesktop(context) ? 1 : 3,
// //             child: TextField(
// //               decoration: InputDecoration(
// //                   filled: true,
// //                   fillColor: AppColors.white,
// //                   contentPadding: const EdgeInsets.only(left: 40.0, right: 5),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(30),
// //                     borderSide: const BorderSide(color: AppColors.white),
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(30),
// //                     borderSide: const BorderSide(color: AppColors.white),
// //                   ),
// //                   prefixIcon: const Icon(Icons.search, color: AppColors.black),
// //                   hintText: 'Search',
// //                   hintStyle:
// //                       const TextStyle(color: AppColors.grey, fontSize: 14)),
// //             ),
// //           ),
// //         ]),
// //         const SizedBox(
// //           height: 30.0,
// //         ),
// //       ],
// //     );
// //   }
// // }
