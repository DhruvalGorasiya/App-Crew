import 'package:app_crew/exports/exports.dart';
import 'package:app_crew/models/note_model.dart';
import 'package:app_crew/view/pages/home/components/note_tile.dart';
import 'package:app_crew/viewModel/home/home_vm.dart';

import 'add_note_page.dart';
import 'components/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: "Notes", style: styleBody16SemiBold),
        titleSpacing: 0,
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        foregroundColor: white,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddNotePage()),
        ),
        child: const Icon(Icons.add),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return buildUi();
        },
      ),
    );
  }

  Widget buildUi() {
    return StreamBuilder<List<NoteModel>>(
      stream: context.read<HomeVM>().getNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final notes = snapshot.data ?? [];

        if (notes.isEmpty) {
          return noItemsFoundWidget(text: "No notes found.");
        }

        return GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount(context: context, maxWidth: 300, minCount: 1),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 100,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteTile(note: notes[index]);
          },
        );
      },
    );
  }
}
