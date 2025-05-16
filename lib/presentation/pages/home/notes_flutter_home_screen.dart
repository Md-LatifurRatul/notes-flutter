import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_flutter/controllers/note_controller.dart';
import 'package:notes_flutter/controllers/sign_out_controller.dart';
import 'package:notes_flutter/routes/app_routes.dart';
import 'package:notes_flutter/widgets/confirm_dialog.dart';
import 'package:notes_flutter/widgets/snack_message.dart';

class NotesFlutterHomeScreen extends StatefulWidget {
  const NotesFlutterHomeScreen({super.key});

  @override
  State<NotesFlutterHomeScreen> createState() => _NotesFlutterHomeScreenState();
}

class _NotesFlutterHomeScreenState extends State<NotesFlutterHomeScreen> {
  final NoteController _noteController = Get.find<NoteController>();

  @override
  void initState() {
    super.initState();
    _noteController.loadNotes();
  }

  Future<void> _signOutUser(BuildContext context) async {
    final SignOutController signOutController = Get.find<SignOutController>();

    final success = await signOutController.signOut();
    if (success) {
      SnackMessage.shownackMessage(
        context: context,
        message: "Sign out successful",
        type: SnackType.success,
      );

      context.pushReplacement(AppRoutes.login);
    } else {
      SnackMessage.shownackMessage(
        context: context,
        message: signOutController.errorMessage,
        type: SnackType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),

        actions: [_buildSignOutSection(context)],
      ),

      body: GetBuilder<NoteController>(
        builder: (noteController) {
          return noteController.notes.isEmpty
              ? const Center(child: Text("No notes added yet."))
              : ListView.separated(
                itemBuilder: (context, index) {
                  final note = noteController.notes[index];
                  return ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                  );
                },
                separatorBuilder:
                    (context, index) =>
                        const Divider(height: 5, color: Colors.grey),
                itemCount: noteController.notes.length,
              );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.addnote);
        },

        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSignOutSection(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(backgroundColor: Colors.yellow),
      onPressed: () async {
        ConfirmDialog.showAlertDialogue(
          context,
          title: "Sign Out",
          content: "Are you sure you want to log-out?",
          confirmString: "Log-out",
          onPressed: () {
            _signOutUser(context);
          },
        );
      },
      icon: Icon(Icons.logout),
    );
  }
}
