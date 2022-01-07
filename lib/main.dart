import 'package:flutter/material.dart';
import 'package:notepad/view/home.dart';
import 'widget/inherited_widget.dart';

void main() => runApp(NotepadApp());

class NotepadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NoteApp',
        home: HomeScreen(),
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
        ),
      ),
    );
  }
}
