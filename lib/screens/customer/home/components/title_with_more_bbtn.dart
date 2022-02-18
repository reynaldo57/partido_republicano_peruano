

import 'package:flutter/material.dart';
import 'package:partido_republicano_peruano/constants.dart';


class TitleWithMoreBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
        Container(
        height: 24,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding / 4),
              child: Text(
                "Autoridades",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(right: kDefaultPadding / 4),
                height: 7,
                color: kPrimaryColor.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
        Spacer(),
          FlatButton(
            onPressed: ()  {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: kPrimaryColor,
            child: Text(
              "Estatuto",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}








// class TitleWithMoreBtn extends StatelessWidget {
//   const TitleWithMoreBtn({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//       child: Row(
//         children: <Widget>[
//           TitleWithCustomUnderline(
//             text: title,
//           ),
//           Spacer(),
//           FlatButton(
//             onPressed: ()  {},
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             color: kPrimaryColor,
//             child: Text(
//               "More",
//               style: TextStyle(color: Colors.white),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


//
//
// class TitleWithCustomUnderline extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 24,
//       child: Stack(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: kDefaultPadding / 4),
//             child: Text(
//               "Autoridades",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               margin: EdgeInsets.only(right: kDefaultPadding / 4),
//               height: 7,
//               color: kPrimaryColor.withOpacity(0.2),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



//
// class TitleWithCustomUnderline extends StatelessWidget {
//   const TitleWithCustomUnderline({
//     Key? key,
//     required this.text,
//   }) : super(key: key);
//
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 24,
//       child: Stack(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: kDefaultPadding / 4),
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               margin: EdgeInsets.only(right: kDefaultPadding / 4),
//               height: 7,
//               color: kPrimaryColor.withOpacity(0.2),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }