import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Logger logger = Logger();

  Future<void> addUser({
    required String name,
    required String email,
    required String phone,
    required String uid,
  }) async {
    try {
      await firestore.collection('profile').doc(uid).set({
        'createdAt': DateTime.now(),
        'name': name,
        'email': email,
        'phone': phone,
        'status': 'gender',
      });
      logger.d('User added in database: $uid');
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> setDocument({
    required String collection,
    required String doc,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    try {
      await firestore
          .collection(collection)
          .doc(doc)
          .set(data, SetOptions(merge: merge));
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> updateProfile({required Map<String, dynamic> data}) async {
    try {
      await setDocument(
        collection: "profile",
        doc: auth.currentUser!.uid,
        data: data,
        merge: true,
      );
      logger.d("Profile Updated (merged) \n$data");
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<DocumentSnapshot> getDocument({
    required String collection,
    required String doc,
  }) async {
    try {
      return await firestore.collection(collection).doc(doc).get();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<DocumentSnapshot> getProfileDocument() async {
    try {
      return getDocument(collection: "profile", doc: auth.currentUser!.uid);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
