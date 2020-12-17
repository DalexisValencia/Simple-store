import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final formSearchKey = GlobalKey<FormState>();
  TextEditingController addNoteController;
  FocusNode noteFocus;
  void initState() {
    super.initState();
    addNoteController = TextEditingController();
    noteFocus = FocusNode();
  }

  void addNote(note) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 25),
      child: Form(
        key: formSearchKey,
        child: TextFormField(
          focusNode: noteFocus,
          onFieldSubmitted: (val) => addNote(val),
          controller: addNoteController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            hintText: 'add Note',
            hintStyle: TextStyle(fontSize: 11),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 2,
                color: Colors.grey[300],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
