


import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  String collection;

  FirestoreService({required this.collection});


  late CollectionReference _firestoreReferences = FirebaseFirestore.instance.collection(this.collection);



  Future <List<Map<String,dynamic>>> getCategories() async{
    List<Map<String, dynamic>> categories = [];
    QuerySnapshot _collectionReference = await _firestoreReferences.get();
    _collectionReference.docs.forEach((QueryDocumentSnapshot element) {
      Map <String, dynamic> categoryMap = element.data() as Map<String, dynamic>;
      categoryMap["id"] = element.id;
      categories.add(categoryMap);
    });

    return categories;

  }



  Future<List<Map<String, dynamic>>> getRepresentatives({String? categoryId}) async{
    List<Map<String, dynamic>> representatives = [];
    QuerySnapshot _collectionReference = await _firestoreReferences.where('category', isEqualTo: categoryId).get();
    _collectionReference.docs.forEach((element) {
      Map<String, dynamic> representativeMap = element.data() as Map<String, dynamic>;
      representativeMap['id'] = element.id;
      representatives.add(representativeMap);
    });
    return representatives;
  }




  Future<List<Map<String, dynamic>>> getAllRepresentatives() async{
    List<Map<String, dynamic>> representatives = [];
    QuerySnapshot _collectionReference = await _firestoreReferences.get();
    _collectionReference.docs.forEach((element) {
      Map<String, dynamic> representativeMap = element.data() as Map<String, dynamic>;
      representativeMap['id'] = element.id;
      representatives.add(representativeMap);
    });
    return representatives;
  }

  addFirestore(Map<String, dynamic> data){
    _firestoreReferences.add(data).then((value){
      return "Succes";
    });
  }





}


