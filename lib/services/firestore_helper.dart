import 'package:app_crew/models/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// USER
  static Future<void> createUser({
    required String uid,
    required String email,
  }) async {
    await _firestore.collection('Users').doc(uid).set({
      'uid': uid,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(String uid) async {
    return await _firestore.collection('Users').doc(uid).get();
  }

  static Future<bool> emailExists(String email) async {
    final query = await _firestore.collection('Users').where('email', isEqualTo: email).limit(1).get();
    return query.docs.isNotEmpty;
  }

  /// NOTES

  static Future<void> addNote(NoteModel note) async {
    await _firestore.collection('Notes').add(note.toMap());
  }

  static Stream<List<NoteModel>> getUserNotes(String uid) {
    return _firestore
        .collection('Notes')
        .where('uid', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => NoteModel.fromMap(doc.id, doc.data())).toList());
  }
}
