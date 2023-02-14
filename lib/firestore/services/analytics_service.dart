import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsService {
  CollectionReference<Map<String, dynamic>> db = FirebaseFirestore.instance.collection('analytics');

  Future updateAnalytics({required String field}) async {
    DocumentReference<Map<String, dynamic>> docRef = db.doc('general');
    DocumentSnapshot<Map<String, dynamic>> docSnap = await docRef.get();

    Map<String, dynamic>? data = docSnap.data();
    docRef.update({field: data![field] + 1});
  }
}
