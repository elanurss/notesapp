import 'package:flutter/material.dart';
import 'package:notepad/widget/inherited_widget.dart';
import 'new_note.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NoteApp',
          style: TextStyle(color: Colors.yellow[200]),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Note(NoteMode.Editing)));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 30.0, 22.0, 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _NoteTitle(_notes[index]['title']),
                    Container(
                      height: 4,
                    ),
                    _NoteText(_notes[index]['text'])
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _notes.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding)));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _title;
  _NoteTitle(this._title);
  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan),
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;
  _NoteText(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(color: Colors.grey.shade900),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
