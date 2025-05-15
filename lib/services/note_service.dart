import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_flutter/models/note_model.dart';
import 'package:notes_flutter/services/firebase_auth_service.dart';

class NoteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuthService _authService = FirebaseAuthService();

  CollectionReference get _noteRef => _firestore
      .collection('users')
      .doc(_authService.currentUser!.uid)
      .collection('notes');
  Future<void> addNotes(NoteModel note) async {
    try {
      await _noteRef.add(note.toMap());
    } catch (e) {
      log("Error adding note: $e");
    }
  }

  Stream<List<NoteModel>> getUserNotes() {
    return _noteRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return NoteModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
