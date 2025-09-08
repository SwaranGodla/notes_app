import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notes_screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp   extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E)
      ),
      home: const NotesScreen(),
    );
  
}

}
