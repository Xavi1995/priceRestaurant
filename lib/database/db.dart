import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:price/models/place.dart';

Stream<List<Place>> getPlaces() {
  return Firestore.instance.collection('Places').snapshots().map(toPlacesList);
  /*return Firestore.instance.collection('Ideas').snapshots().map(toIdeasList);*/
}

/*
Stream<List<User>> getUsers() {
  return Firestore.instance.collection('Users').snapshots().map(toUserList);
}
*/
/*
Future<void> sendIdea(User idea) async {
  await Firestore.instance.collection('Ideas').add(idea.toFirestore());
}
*/
