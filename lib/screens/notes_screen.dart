import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/notes_database.dart';
import 'package:flutter_application_1/screens/note_card.dart';
import 'package:flutter_application_1/screens/note_dialog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final fetchedNotes = await NotesDatabase.instance.getNotes();
    setState(() {
      this.notes = fetchedNotes;
    });
  }

  final List<Color> noteColors = [
    const Color(0xFFF44336),
    const Color(0xFF8BC34A),
    const Color(0xFF4FC3F7),
    const Color(0xFFFFC107),
    const Color(0xFF9575CD),
    const Color(0xFF673AB7),
    const Color(0xFFE91E63),
    const Color(0xFF2196F3),
    const Color(0xFFCDDC39),
    const Color(0xFF795548),
    const Color(0xFF9C27B0),
    const Color(0xFF00BCD4),
    const Color(0xFFE64A19),
    const Color(0xFF607D8B),
    const Color(0xFF4CAF50),
    const Color(0xFF2196F3),
    const Color(0xFF9C27B0),
    const Color(0xFF00BCD4),
    const Color(0xFFE64A19),
    const Color(0xFF607D8B),
  ];

  void showNoteDialog({
    int? id,
    String? title,
    String? content,
    int colorIndex = 0,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return NoteDialog(
          noteId: id,
          title: title,
          content: content,
          colorIndex: colorIndex,
          noteColors: noteColors,
          onNoteSaved: (id, newTitle, newContent, colorIndex, currentDate) async {
            if (id == null) {
              await NotesDatabase.instance.addNote(
                newTitle,
                newContent,
                currentDate,
                colorIndex
              );
            } else {
              await NotesDatabase.instance.updateNote(
                id,
                newTitle,
                newContent,
                currentDate,
                colorIndex
              );
            }
            await fetchNotes();
            // Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ), // appbar
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showNoteDialog();
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black87),
      ), // floating action button
      body: notes.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.note_outlined, size: 80, color: Colors.grey),
                  const SizedBox(height: 20),
                  Text(
                    'No notes yet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ), //text style
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NoteCard(
                    note: note,
                    onDelete: () async {
                      await NotesDatabase.instance.deleteNote(note['id']);
                      fetchNotes();
                    },
                    onTap: () {
                      showNoteDialog(
                        id: note['id'],
                        title: note['title'],
                        content: note['description'],
                        colorIndex: note['color'],
                      );
                    },
                    noteColors: noteColors,
                  );
                },
              ),
            ),
    ); // scaffold
  }
}
