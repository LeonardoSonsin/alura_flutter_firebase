import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_firestore_first/firestore/models/listin.dart';
import 'package:uuid/uuid.dart';

class ListinsService {
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection('listins');

  Stream<List<Listin>> getAll() {
    return db
        .orderBy('name')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Listin.fromMap(doc.data()))
        .toList());
  }

  Future addNewList({required String name}) async {
    Listin listin = Listin(id: const Uuid().v1(), name: name);
    db.doc(listin.id).set(listin.toMap());
  }

  Future updateList({required String id, required String name}) async {
    DocumentReference docRef = db.doc(id);
    Listin listin = Listin(id: id, name: name);
    docRef.update(listin.toMap());
  }

  Future deleteList({required String id}) async {
    DocumentReference docRef = db.doc(id);
    await docRef.delete();
  }
}
