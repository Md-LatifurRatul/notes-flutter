import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_flutter/controllers/note_controller.dart';
import 'package:notes_flutter/models/note_model.dart';
import 'package:notes_flutter/widgets/custom_elevated_button.dart';
import 'package:notes_flutter/widgets/snack_message.dart';

class AddNotesScreen extends StatelessWidget {
  AddNotesScreen({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Note")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                focusNode: _titleFocusNode,
                controller: _titleController,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_descFocusNode);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                focusNode: _descFocusNode,
                controller: _descController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your description";
                  }
                  return null;
                },
                maxLines: 3,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {},
              ),
              const SizedBox(height: 20),
              _buildAddNote(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddNote(BuildContext context) {
    return GetBuilder<NoteController>(
      builder: (noteController) {
        return noteController.inProgress
            ? const Center(child: CircularProgressIndicator())
            : CustomElevatedButton(
              buttonName: 'Add Note',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final note = NoteModel(
                    title: _titleController.text.trim(),
                    description: _descController.text.trim(),
                  );

                  await noteController.addNote(note);
                  SnackMessage.shownackMessage(
                    context: context,
                    message: "Noted Added Successfully",
                    type: SnackType.success,
                  );
                  context.pop();
                }
              },
            );
      },
    );
  }
}
