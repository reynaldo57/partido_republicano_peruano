



import 'package:flutter/material.dart';
import 'package:partido_republicano_peruano/services/firestore_services.dart';
import 'package:partido_republicano_peruano/widgets/modal_add_edit_regional.dart';

class RegionalAdminPage extends StatefulWidget {

  @override
  State<RegionalAdminPage> createState() => _RegionalAdminPageState();
}

class _RegionalAdminPageState extends State<RegionalAdminPage> {
  FirestoreService _firestoreService = new FirestoreService(collection: "representatives");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Autoridad Regional"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegionalAddEditAdminPage()));

        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _firestoreService.getAllRepresentatives(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.hasData){
            List<Map<String, dynamic>> representatives = snap.data;
            return ListView.builder(
              itemCount: representatives.length,
              itemBuilder: (BuildContext, int index){
                return Card(
                  child: ListTile(
                    title: Text(representatives[index]["name"]),
                    subtitle: Text(representatives[index]["description"],
                    maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Container(
                      height: 100,
                      width: 100,
                      child: Image.network(representatives[index]["image"],),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                );
              },

            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}





































// import 'package:flutter/material.dart';
// import 'package:partido_republicano_peruano/services/firestore_services.dart';
// import 'package:partido_republicano_peruano/widgets/modal_add_edit_regional.dart';
//
// class CategoryAdminPage extends StatefulWidget {
//   @override
//   State<CategoryAdminPage> createState() => _CategoryAdminPageState();
// }
//
// class _CategoryAdminPageState extends State<CategoryAdminPage> {
//   FirestoreService _firestoreService =
//       new FirestoreService(collection: 'regionals');
//
//
//   showAddRegionalDialog() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return ModalAddEdit();
//         }
//         );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Autoridades Regioniales"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           showAddRegionalDialog();
//         },
//       ),
//       body: FutureBuilder(
//         future: _firestoreService.getAllRegionoals(),
//         builder: (BuildContext context, AsyncSnapshot snap) {
//           if (snap.hasData) {
//             List<Map<String, dynamic>> regionals = snap.data;
//             return ListView.builder(
//               itemCount: regionals.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text(regionals[index]["description"]),
//                     subtitle: Text(
//                       regionals[index]["name"],
//                     ),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(onPressed: (){}, icon: Icon(Icons.delete),),
//                         IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
//
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
