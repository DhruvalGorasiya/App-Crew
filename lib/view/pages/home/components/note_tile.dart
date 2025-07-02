import 'package:app_crew/exports/exports.dart';
import 'package:app_crew/models/note_model.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;
  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(text: note.title, style: styleBody14Bold),
            h(4),
            customText(
              text: note.message,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
