//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:partido_republicano_peruano/constants.dart';
// import 'package:partido_republicano_peruano/screens/customer/details_autoridades_nacionales/details_screen.dart';
// import 'package:partido_republicano_peruano/services/firestore_services.dart';
//
//
// class FeaturedPlants extends StatelessWidget {
//
//   FirestoreService _representativeFirestoreService = new FirestoreService(collection: 'representatives');
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _representativeFirestoreService.getRepresentatives(),
//       builder: (BuildContext context, AsyncSnapshot snap) {
//         if (snap.hasData){
//           List<Map<String,dynamic>> representatives = snap.data;
//           return SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: representatives.map<Widget>((e) => GestureDetector(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsAutoridadNacional()));
//
//             },
//             child: Container(
//               margin: EdgeInsets.only(
//                 left: kDefaultPadding,
//                 top: kDefaultPadding / 2,
//                 bottom: kDefaultPadding * 2.5,
//               ),
//
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     width: 175,
//                     height: 200,
//                     padding: EdgeInsets.all(kDefaultPadding / 2),
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                           e["image"],
//                         ),
//                       ),
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(10.0),
//                         // bottomLeft: Radius.circular(15),
//                         // bottomRight: Radius.circular(15),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(0, 10.0),
//                           blurRadius: 50,
//                           color: kPrimaryColor.withOpacity(0.23),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(10.0),
//                         // bottomLeft: Radius.circular(15),
//                         // bottomRight: Radius.circular(15),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(0, 10.0),
//                           blurRadius: 50,
//                           color: kPrimaryColor.withOpacity(0.23),
//                         ),
//                       ],
//                     ),
//                     width: 175,
//                     height: 50,
//                     child: Row(
//                       children: <Widget>[
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: e["name"]?.toUpperCase(),
//                                 style: Theme.of(context).textTheme.button,
//                               ),
//                               TextSpan(
//                                 text: e["description"].toUpperCase(),
//                                 style: TextStyle(
//                                   color: kPrimaryColor.withOpacity(0.5),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//             ).toList(),
//           ),
//           );
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//
//       },
//     );
//   }
// }
//
//
// //
// //
// // class FeaturedPlants extends StatelessWidget {
// //   const FeaturedPlants({
// //     Key? key,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       scrollDirection: Axis.horizontal,
// //       child: Row(
// //         children: [
// //           FeaturePlantCard(
// //             image: "assets/images/bottom_img_1.png",
// //           ),
// //           FeaturePlantCard(
// //             image: "assets/images/bottom_img_2.png",
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// // class FeaturePlantCard extends StatelessWidget {
// //
// //
// //   final String image, title, country;
// //   final   Widget? goTo;
// //
// //
// //
// //   FeaturePlantCard({
// //     required this.image,
// //     required this.title,
// //     required this.country,
// //     required this.goTo
// //   });
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // return GestureDetector(
// //     //   onTap: () {
// //     //     Navigator.push(
// //     //       context,
// //     //       MaterialPageRoute(
// //     //         builder: (context) => this.goTo!,
// //     //       ),
// //     //     );
// //     //   },
// //     //   child: Container(
// //     //     margin: EdgeInsets.only(
// //     //       left: kDefaultPadding,
// //     //       top: kDefaultPadding / 2,
// //     //       bottom: kDefaultPadding * 2.5,
// //     //     ),
// //     //
// //     //     child: Column(
// //     //       children: <Widget>[
// //     //         Container(
// //     //           width: 175,
// //     //           height: 200,
// //     //           padding: EdgeInsets.all(kDefaultPadding / 2),
// //     //           decoration: BoxDecoration(
// //     //             image: DecorationImage(
// //     //               fit: BoxFit.cover,
// //     //               image: NetworkImage(
// //     //                 this.image,
// //     //               ),
// //     //             ),
// //     //             color: Colors.white,
// //     //             borderRadius: BorderRadius.all(Radius.circular(10.0),
// //     //               // bottomLeft: Radius.circular(15),
// //     //               // bottomRight: Radius.circular(15),
// //     //             ),
// //     //             boxShadow: [
// //     //               BoxShadow(
// //     //                 offset: Offset(0, 10.0),
// //     //                 blurRadius: 50,
// //     //                 color: kPrimaryColor.withOpacity(0.23),
// //     //               ),
// //     //             ],
// //     //           ),
// //     //         ),
// //     //         Container(
// //     //           decoration: BoxDecoration(
// //     //
// //     //             color: Colors.white,
// //     //             borderRadius: BorderRadius.all(Radius.circular(10.0),
// //     //               // bottomLeft: Radius.circular(15),
// //     //               // bottomRight: Radius.circular(15),
// //     //             ),
// //     //             boxShadow: [
// //     //               BoxShadow(
// //     //                 offset: Offset(0, 10.0),
// //     //                 blurRadius: 50,
// //     //                 color: kPrimaryColor.withOpacity(0.23),
// //     //               ),
// //     //             ],
// //     //           ),
// //     //           width: 175,
// //     //           height: 50,
// //     //             child: Row(
// //     //             children: <Widget>[
// //     //               RichText(
// //     //                 text: TextSpan(
// //     //                   children: [
// //     //                     TextSpan(
// //     //                       text: "$title\n".toUpperCase(),
// //     //                       style: Theme.of(context).textTheme.button,
// //     //                     ),
// // //     //                     TextSpan(
// // //     //                       text: "$country".toUpperCase(),
// // //     //                       style: TextStyle(
// // //     //                         color: kPrimaryColor.withOpacity(0.5),
// // //     //                       ),
// // //     //                     ),
// // //     //                   ],
// // //     //                 ),
// // //     //               ),
// // //     //               Spacer(),
// // //     //
// // //     //             ],
// // //     //           ),
// // //     //         )
// // //     //       ],
// // //     //     ),
// // //     //   ),
// // //     // );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // // class FeaturePlantCard extends StatelessWidget {
// //   const FeaturePlantCard({
// //     Key? key,
// //     required this.image,
// //
// //   }) : super(key: key);
// //
// //   final String image;
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return GestureDetector(
// //       onTap: (){},
// //       child: Container(
// //         margin: EdgeInsets.only(
// //           left: kDefaultPadding,
// //           top: kDefaultPadding/2,
// //           bottom: kDefaultPadding/2,
// //         ),
// //         width: size.width *0.8,
// //         height: 185,
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(10.0),
// //           image: DecorationImage(
// //             fit: BoxFit.cover,
// //             image: AssetImage(image),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }