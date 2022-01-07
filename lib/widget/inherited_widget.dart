import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {
  final notes = [
    {'title': 'Meeting for next week', 'text': 'Tarih: 07.08.2022'},
    {'title': 'Home renovation project', 'text': 'Tarih: 08.09.2022'},
    {'title': 'Code write in visual studio', 'text': 'Tarih: 09.10.2022'}
  ];
  NoteInheritedWidget(Widget child) : super(child: child);
  static NoteInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>();
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }
}
