import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partido_republicano_peruano/services/firestore_services.dart';

class RegionalAddEditAdminPage extends StatefulWidget {
  @override
  _RegionalAddEditAdminPageState createState() =>
      _RegionalAddEditAdminPageState();
}

class _RegionalAddEditAdminPageState extends State<RegionalAddEditAdminPage> {
  final _formKey = GlobalKey<FormState>();

  FirestoreService _categoryFirestoreService =
  new FirestoreService(collection: "categories");

  FirestoreService _regionalFirestoreService =
      new FirestoreService(collection: "representatives");

  firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;


  TextEditingController _nameController = new TextEditingController();
  TextEditingController _DescriptionController = new TextEditingController();

  List<Map<String, dynamic>> categories = [];
  String selectCategory = "";
  ImagePicker _picker = new ImagePicker();
  XFile? image;
  bool isLoading = false;

   @override
   initState(){
     super.initState();
     getDataCategory();
   }

  getDataCategory(){
    _categoryFirestoreService .getCategories().then((value) {
      categories = value;
      selectCategory = categories[0]["id"];
      setState(() {

      });
    });
  }

  getImageGallery() async {
    XFile? selectImageGallery =
        await _picker.pickImage(source: ImageSource.gallery);
    image = selectImageGallery;
    setState(() {});
  }

  getImageCamera() async {
    XFile? selectImageCamera =
        await _picker.pickImage(source: ImageSource.camera);
    image = selectImageCamera;
    setState(() {});
  }

  uploadImageFirebase() async {
    firebase_storage.Reference reference = _storage.ref().child('representatives');
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload =
        await reference.child("$time.jpg").putFile(File(image!.path));
    String url = await upload.ref.getDownloadURL();
    saveRegional(url);
  }

  saveRegional(String urlImage) {
    Map<String, dynamic> representative = {
      "name": _nameController.text,
      "description": _DescriptionController.text,
      "image": urlImage,
      "category": selectCategory,
    };
    _regionalFirestoreService.addFirestore(representative);
    isLoading = false;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Autoridad Regional"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (image != null) {
              isLoading = true;
              setState(() {});
              uploadImageFirebase();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Por favor Selecciona Una Imagen",
                  ),
                  backgroundColor: Colors.deepOrangeAccent,
                ),
              );
            }
          }

          // uploadImageFirebase();
        },
        child: Icon(Icons.save),
      ),
      body: !isLoading
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Autoridad",
                          hintText: "Nombre de la Autoridad",
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty || value == null) {
                            return "completar el campo";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _DescriptionController,
                        decoration: InputDecoration(
                          labelText: "Descripcion",
                          hintText: "Descripcion del candidato",
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty || value == null) {
                            return "completar el campo";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      DropdownButtonFormField<String>(
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                            labelText: "Categorias",
                            hintText: "--Selecciona una categoria--"),
                        value: selectCategory,
                        onChanged: (String? value) {
                          print(value);
                        },
                        items: categories
                            .map((e) => DropdownMenuItem<String>(
                          child: Text(e["description"]),
                          value: e["id"],
                        ))
                            .toList(),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "image",
                      //     hintText: "Agrega Imagen",
                      //   ),
                      //   validator: (String? value) {
                      //     if (value!.isEmpty || value == null) {
                      //       return "completar el campo";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "imageAuth",
                      //     hintText: "Imagen de candidato",
                      //   ),
                      //   validator: (String? value) {
                      //     if (value!.isEmpty || value == null) {
                      //       return "completar el campo";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      SizedBox(
                        height: 200.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Imagen "),
                          ElevatedButton.icon(
                            onPressed: () {
                              getImageGallery();
                            },
                            icon: Icon(Icons.photo),
                            label: Text("Galeria"),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              getImageCamera();
                            },
                            icon: Icon(Icons.photo),
                            label: Text("Camara"),
                          ),
                        ],
                      ),
                      image != null
                          ? Container(
                              height: 200.0,
                              width: double.infinity,
                              child: Image.file(
                                File(
                                  image!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Text(
                              "no hay imagen",
                            ),
                      SizedBox(
                        height: 70.0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'package:partido_republicano_peruano/services/firestore_services.dart';
//
// class ModalAddEdit extends StatefulWidget {
//
//   @override
//   _ModalAddEditState createState() => _ModalAddEditState();
// }
//
// final _formKey = GlobalKey<FormState>();
// // TextEditingController _regionalController = new TextEditingController();
// FirestoreService _firestoreService = new FirestoreService(collection: 'regionals');
//
//
//
// class _ModalAddEditState extends State<ModalAddEdit> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("Agregar Autoridad"),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               // controller: _regionalController,
//               decoration: InputDecoration(hintText: "Autoridad Regional Actual"),
//               validator: (String? value){
//                 if(value == null || value.isEmpty){
//                   return "Campo Obligatorio";
//                 }
//                 return null;
//               },
//             ),
//             // Row(
//             //   children: [
//             //     Text("Orden: "),
//             //     // Checkbox(
//             //     //   value: _order,
//             //     //   onChanged: (bool? value) {
//             //     //     _order = value!;
//             //     //     setState(() {
//             //     //
//             //     //     });
//             //     //   },
//             //     // ),
//             //   ],
//             // )
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text("Cancelar"),
//         ),
//         TextButton(
//           onPressed: () {
//
//             if(_formKey.currentState!.validate()){
//               _firestoreService.addFirestore({
//                 "description": "name",
//               }
//               );
//
//             }
//           },
//           child: Text("Agregar"),
//         ),
//       ],
//     );
//   }
// }
