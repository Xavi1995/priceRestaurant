import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String surname1;
  String surname2;
  int age;

  User(
    this.name,
    this.surname1,
    this.surname2,
    this.age,
  );

  User.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        name = doc.data['name'],
        surname1 = doc.data['surname1'],
        surname2 = doc.data['surname2'],
        age = doc.data['age'];

  Map<String, dynamic> toFirestore() => {
        'name': name,
        'surname1': surname1,
        'surname2': surname2,
        'age': age,
      };
}

List<User> toUserList(QuerySnapshot query) {
  return query.documents.map((doc) => User.fromFirestore(doc));
}
