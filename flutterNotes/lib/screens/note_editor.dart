import 'package:flutter/material.dart';
import 'package:note_taking_app/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:note_taking_app/main.dart';
import 'package:note_taking_app/screens/home_page.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int colorId = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();

  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add a new note",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Notes title", 
              ),
              style: AppStyle.mainTitle,
            ),
            Text(date, style: AppStyle.dateTitle),
            const SizedBox(height: 15.0),
      
            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Notes content", 
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "notes_title": titleController.text,
            "note_content": mainController.text,
            "creation_date": date,
            "color_id": colorId,
          }).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())));
        },
        backgroundColor: AppStyle.accentColor,
        child: Icon(Icons.save)
      ),
    );
  } 
}