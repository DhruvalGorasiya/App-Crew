import 'package:app_crew/exports/exports.dart';
import 'package:app_crew/viewModel/home/home_vm.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: backButton(context, color: white),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: paddingA,
            child: Form(
              key: key,
              child: Container(
                constraints: webWidthConstraint,
                color: white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    h(20),
                    customPaddingH(
                      children: [
                        customText(
                          text: "Create a New Note",
                          style: styleTitle24SemiBold,
                        ),
                        h(24),
                        customTextFiled(
                          titleText: "Title",
                          hintText: "Enter note title",
                          controller: titleController,
                          validator: (val) => val!.isEmpty ? "Title is required" : null,
                          textInputAction: TextInputAction.next,
                        ),
                        h(16),
                        customTextFiled(
                          titleText: "Message",
                          hintText: "Enter note message",
                          controller: messageController,
                          minLines: 5,
                          validator: (val) => val!.isEmpty ? "Message is required" : null,
                        ),
                      ],
                    ),
                    h(22),
                    customButton(
                      name: "Submit",
                      isLoading: context.watch<HomeVM>().isSubmitting,
                      onTap: () async {
                        if (key.currentState!.validate()) {
                          await context.read<HomeVM>().submitNote(
                                title: titleController.text,
                                message: messageController.text,
                              );
                          showSuccessToast(context, "Note added successfully");
                          Navigator.pop(context); // return to HomePage
                        }
                      },
                    ),
                    h(24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
