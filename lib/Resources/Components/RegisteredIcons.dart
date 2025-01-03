
// import 'package:flutter/material.dart';

// class RegistrationIcon extends StatefulWidget {
//   const RegistrationIcon({super.key});

//   @override
//   State<RegistrationIcon> createState() => _RegistrationIconState();
// }

// class _RegistrationIconState extends State<RegistrationIcon> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     var iconsColor = const Color.fromARGB(156, 220, 224, 224);
//     // Scale factors for icons and paddings
//     final double iconSize =
//         screenHeight * 0.03; // Icon size scaled to screen height
//     final double paddingSize =
//         screenWidth * 0.02; // Padding scaled to screen width
//     final double lineHeight =
//         screenHeight * 0.003; // Line height is 0.3% of the screen height

//     // A common function to build circle icons with consistent padding
//     Widget buildCircleIcon(
//         {required IconData icon,
//         required Color color,
//         bool applyborder = false}) {
//       return Container(
//         padding: EdgeInsets.all(paddingSize),
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: color,
//             border: applyborder ? Border.all(color: Colors.black) : null),
//         child: Icon(
//           icon,
//           size: iconSize,
//         ),
//       );
//     }

//     // A common function to build connecting lines between icons
//     Widget buildLine() {
//       return Expanded(
//         child: Container(
//           height: lineHeight,
//           color: Colors.grey,
//         ),
//       );
//     }

//     return SizedBox(
//       height: screenHeight * 0.08,
//       width: screenWidth,
//       child: Padding(
//         padding: EdgeInsets.all(paddingSize),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // buildCircleIcon(
//             //     icon: Icons.person,
//             //     color: iconsColor,
//             //     applyborder: Staticvariable.iconvalue == 1),
//             // buildLine(),
//             // buildCircleIcon(
//             //     icon: Icons.photo,
//             //     color: iconsColor,
//             //     applyborder: Staticvariable.iconvalue == 2),
//             // buildLine(),
//             // buildCircleIcon(
//             //     icon: Icons.calendar_today,
//             //     color: iconsColor,
//             //     applyborder: Staticvariable.iconvalue == 3),
//             // buildLine(),
//             buildCircleIcon(
//                 icon: Icons.payment,
//                 color: iconsColor,
//                 applyborder: Staticvariable.iconvalue == 4),
//             buildLine(),
//             buildCircleIcon(
//                 icon: Icons.app_registration,
//                 color: iconsColor,
//                 applyborder: Staticvariable.iconvalue == 5),
//           ],
//         ),
//       ),
//     );
//   }
// }
