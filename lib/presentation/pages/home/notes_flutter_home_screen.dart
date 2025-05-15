import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_flutter/controllers/sign_out_controller.dart';
import 'package:notes_flutter/routes/app_routes.dart';
import 'package:notes_flutter/widgets/confirm_dialog.dart';
import 'package:notes_flutter/widgets/snack_message.dart';

class NotesFlutterHomeScreen extends StatelessWidget {
  const NotesFlutterHomeScreen({super.key});

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
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
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
          ),
        ],
      ),
    );
  }
}
