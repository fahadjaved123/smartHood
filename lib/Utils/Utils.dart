// import 'package:another_flushbar/flushbar.dart';
// import 'package:another_flushbar/flushbar_route.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:smart_neighbourhood/res/Constants/App_colors.dart';

// class Utils {
//   static changefocusnode(
//       BuildContext context, FocusNode current, FocusNode next) {
//     current.unfocus();
//     FocusScope.of(context).requestFocus(next);
//   }

//   static fluttertoast(String msg) {
//     Fluttertoast.showToast(
//       msg: msg,
//       backgroundColor: Appcolors.backgroundColor_red,
//       textColor: Appcolors.textColor_white,
//       fontSize: 20,
//     );
//   }

//   static void Flashbarmessage(String mess, BuildContext context) {
//     showFlushbar(
//         context: context,
//         flushbar: Flushbar(
//           message: mess,
//           backgroundColor: Colors.green,
//           duration: Duration(seconds: 2),
//           flushbarPosition: FlushbarPosition.TOP,
//           forwardAnimationCurve: Curves.decelerate,
//           reverseAnimationCurve: Curves.easeInOutBack,
//           padding: EdgeInsets.all(15),
//           margin: EdgeInsets.only(left: 10, right: 10, top: 15),
//           borderRadius: BorderRadius.circular(10),
//           icon: Icon(
//             Icons.gpp_good_outlined,
//             color: Colors.white,
//             size: 25,
//           ),
//         )..show(context));
//   }

//   static void Flashbarerrormessage(String mess, BuildContext context) {
//     showFlushbar(
//         context: context,
//         flushbar: Flushbar(
//           message: mess,
//           messageSize: 15,
//           backgroundColor: Colors.red.shade400,
//           duration: Duration(seconds: 3),
//           flushbarPosition: FlushbarPosition.TOP,
//           forwardAnimationCurve: Curves.decelerate,
//           reverseAnimationCurve: Curves.easeInOutBack,
//           padding: EdgeInsets.all(15),
//           margin: EdgeInsets.only(left: 10, right: 10, top: 15),
//           borderRadius: BorderRadius.circular(10),
//           icon: Icon(
//             Icons.error,
//             color: Appcolors.backgroundColor_white,
//             size: 25,
//           ),
//         )..show(context));
//   }
// }
