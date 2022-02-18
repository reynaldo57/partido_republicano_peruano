//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:partido_republicano_peruano/constants.dart';
// import 'package:partido_republicano_peruano/services/firestore_services.dart';
// import 'package:partido_republicano_peruano/utils/search_product.dart';
//
//
//
// class HeaderWithSearchBox extends StatelessWidget {
//
//   FirestoreService _regionalFirestoreService = new FirestoreService(collection: 'representatives');
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
//
//       height: 170,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(
//               left: kDefaultPadding,
//               right: kDefaultPadding,
//               bottom: 10 + kDefaultPadding,
//             ),
//             height: 200,
//             decoration: BoxDecoration(
//               color: kPrimaryColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(36),
//                 bottomRight: Radius.circular(36),
//               ),
//             ),
//             child: Row(
//               children: <Widget>[
//                 Text(
//                     'P R P',
//                     style: Theme.of(context).textTheme.headline5?.copyWith(
//                         color: Colors.white, fontWeight: FontWeight.bold)
//                 ),
//                 Spacer(),
//                 Image.asset("assets/images/logo.png")
//
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               height: 54,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20.0),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 10),
//                     blurRadius: 50,
//                     color: kPrimaryColor.withOpacity(0.23),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       onChanged: (value) {},
//                       decoration: InputDecoration(
//                         hintText: "search",
//                         hintStyle: TextStyle(
//                           color: kPrimaryColor.withOpacity(0.5),
//                         ),
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   //SvgPicture.asset("assets/icons/search.svg"),
//                   IconButton(onPressed: () async{
//                     final result = await showSearch(context: context, delegate: SearchProduct(listRegionals: await _regionalFirestoreService.getAllRepresentatives()));
//                   },
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.black,
//                       )
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
