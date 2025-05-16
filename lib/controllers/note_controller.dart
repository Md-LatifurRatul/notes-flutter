import 'dart:developer';

import 'package:get/get.dart';
import 'package:notes_flutter/models/note_model.dart';
import 'package:notes_flutter/services/note_service.dart';

class NoteController extends GetxController {
  final NoteService _noteService = NoteService();
  List<NoteModel> notes = [];
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  void loadNotes() {
    _noteService.getUserNotes().listen((updatedNotes) {
      notes = updatedNotes;
      update();
    });
  }

  Future<void> addNote(NoteModel note) async {
    try {
      _inProgress = true;
      update();
      await _noteService.addNotes(note);
    } catch (e) {
      log(e.toString());
    } finally {
      _inProgress = false;
      update();
    }
  }
}
