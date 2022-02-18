// import 'package:flutter/material.dart';
// import 'package:partido_republicano_peruano/constants.dart';
// import 'package:partido_republicano_peruano/screens/customer/details/details_screen.dart';
// import 'package:partido_republicano_peruano/services/firestore_services.dart';
//
// class RecomendsPlants extends StatelessWidget {
//   FirestoreService _representativeFirestoreService = new FirestoreService(collection: 'representatives');
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _representativeFirestoreService.getRepresentatives(categoryId: "wQAPfJESxvFfOxvEhRmQ"),
//       builder: (BuildContext context, AsyncSnapshot snap) {
//         if (snap.hasData) {
//           List<Map<String, dynamic>> representatives = snap.data;
//           return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: representatives.map<Widget>((e) => RecomendPlantCard(
//                     image: e["image"],
//                     title: e['name'],
//                     country: e['description'],
//                     goTo: DetailsScreen(regional: e,),
//                 ),
//               ).toList(),
//               ),
//               );
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
//
// class RecomendPlantCard extends StatelessWidget {
//   String image, title, country;
//   Widget? goTo;
//
//   RecomendPlantCard(
//       {required this.image,
//       required this.title,
//       required this.country,
//       required this.goTo});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => this.goTo!,
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.only(
//           left: kDefaultPadding,
//           top: kDefaultPadding / 2,
//           bottom: kDefaultPadding * 2.5,
//         ),
//
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: 175,
//               height: 200,
//               padding: EdgeInsets.all(kDefaultPadding / 2),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(
//                     this.image,
//                   ),
//                 ),
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(10.0),
//
//                   // borderRadius: BorderRadius.only(
//                   // bottomLeft: Radius.circular(10),
//                   // bottomRight: Radius.circular(10),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 10.0),
//                     blurRadius: 50,
//                     color: kPrimaryColor.withOpacity(0.23),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(10.0),
//                   // bottomLeft: Radius.circular(15),
//                   // bottomRight: Radius.circular(15),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 10.0),
//                     blurRadius: 50,
//                     color: kPrimaryColor.withOpacity(0.23),
//                   ),
//                 ],
//               ),
//               width: 175,
//               height: 50,
//               child: Row(
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "$title\n".toUpperCase(),
//                           style: Theme.of(context).textTheme.button,
//                         ),
//                         TextSpan(
//                           text: "$country".toUpperCase(),
//                           style: TextStyle(
//                             color: kPrimaryColor.withOpacity(0.5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
