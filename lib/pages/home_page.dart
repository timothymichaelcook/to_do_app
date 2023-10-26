import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // FIRESTORE
  final FirestoreService firestoreService = FirestoreService();

  // TEXT CONTROLLER
  final TextEditingController textController = TextEditingController();
  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // USER INPUT
        content: TextField(
          controller: textController,
        ),
        actions: [
          // SAVE BUTTON
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                // CREATE NOTE
                firestoreService.addNote(textController.text);
              } else {
                //UPDATE NOTE
                firestoreService.updateNote(docID, textController.text);
              }

              // CLEAR TEXT
              textController.clear();

              // CLOSE BOX
              Navigator.pop(context);
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(title: const Text("Notes")),
      // BOTTOM RIGHT BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          // GET DATA IN FIREBASE
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            // DISPLAY AS LIST
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                // GET DOC
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                // GET NOTE FROM DOC
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                // DISPLAY AS LIST TILE
                return ListTile(
                  title: Text(noteText),
                  // LIST ROW
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // UPDATE BUTTON
                      IconButton(
                        onPressed: () => openNoteBox(docID: docID),
                        icon: const Icon(Icons.settings),
                      ),
                      // DELETE BUTTON
                      IconButton(
                        onPressed: () => firestoreService.deleteNote(docID),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }
}
