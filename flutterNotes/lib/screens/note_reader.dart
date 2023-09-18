import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  QueryDocumentSnapshot doc;
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key); 

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc["color_id"];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.doc["notes_title"], style: AppStyle.mainTitle),
            const SizedBox(height: 5.0),
            Text(widget.doc["creation_title"], style: AppStyle.dateTitle),
            const SizedBox(height: 20.0),
            Text(widget.doc["note_content"], style: AppStyle.mainContent, overflow: TextOverflow.ellipsis, maxLines: 5),
          ],
        ),
      ),
    );
  }
}