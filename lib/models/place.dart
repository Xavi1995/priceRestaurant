import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  String id;
  String name;
  String adress;
  double totalPrice;
  int avgAge;

  

  Place.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        name = doc.data['name'],
        adress = doc.data['adress'],
        totalPrice = double.parse(doc.data['totalPrice']),
        avgAge = doc.data['avgAge'];
}

List<Place> toPlacesList(QuerySnapshot query) {
  return query.documents.map((doc) => Place.fromFirestore(doc)).toList();
}
