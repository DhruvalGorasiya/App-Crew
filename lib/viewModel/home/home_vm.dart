import 'package:app_crew/exports/exports.dart';
import 'package:app_crew/models/note_model.dart';
import 'package:app_crew/services/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeVM extends ChangeNotifier {
  bool isSubmitting = false;

  Future<void> submitNote({
    required String title,
    required String message,
  }) async {
    if (title.isEmpty || message.isEmpty) return;

    isSubmitting = true;
    notifyListeners();

    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) throw Exception("User not logged in");

      final note = NoteModel(
        id: '',
        uid: uid,
        title: title,
        message: message,
        createdAt: DateTime.now(),
      );

      await FirestoreService.addNote(note);
    } catch (e) {
      debugPrint('Note submit error: $e');
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }

  Stream<List<NoteModel>> getNotes() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return const Stream.empty();
    return FirestoreService.getUserNotes(uid);
  }
}
