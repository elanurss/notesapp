import 'package:flutter/material.dart';
import 'package:notepad/widget/inherited_widget.dart';

enum NoteMode { Editing, Adding }

class Note extends StatefulWidget {
  final NoteMode noteMode;
  Note(this.noteMode);
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Yeni Not Ekle' : 'Düzenle',
          style: TextStyle(color: Colors.yellow[200]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Not Başlığı'),
            ),
            Container(
              height: 8.0,
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: 'Not İçeriği'),
            ),
            Container(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NoteButton('Kaydet', Colors.cyan, () {
                  if (widget?.noteMode == NoteMode.Adding) {
                    final title = _titleController.text;
                    final text = _textController.text;
                    _notes.add({'title': title, 'text': text});
                  }
                  Navigator.pop(context);
                }),
                _NoteButton('Vazgeç', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing
                    ? _NoteButton('Sil', Colors.redAccent, () {
                        Navigator.pop(context);
                      })
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;
  _NoteButton(this._text, this._color, this._onPressed);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: _color,
    );
  }
}
