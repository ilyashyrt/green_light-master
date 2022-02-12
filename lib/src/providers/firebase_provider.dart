import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  final FirebaseFirestore firebaseFirestore;
  FirebaseProvider({required this.firebaseFirestore});

  Stream<DocumentSnapshot> getStreamMessage() {
    return firebaseFirestore.collection("test").doc("title").snapshots();
  }
}
