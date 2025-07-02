import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String id;
  final String uid;
  final String title;
  final String message;
  final DateTime createdAt;

  NoteModel({
    required this.id,
    required this.uid,
    required this.title,
    required this.message,
    required this.createdAt,
  });

  factory NoteModel.fromMap(String id, Map<String, dynamic> data) {
    return NoteModel(
      id: id,
      uid: data['uid'],
      title: data['title'],
      message: data['message'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'title': title,
        'message': message,
        'createdAt': createdAt,
      };
}
