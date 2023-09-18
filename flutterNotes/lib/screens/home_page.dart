import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/screens/note_editor.dart';
import 'package:note_taking_app/style/app_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_taking_app/widgets/notes_card.dart';
import 'package:note_taking_app/screens/note_reader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        title: const Text("FireNotes"),
        backgroundColor: AppStyle.mainColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your recent Notes",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
            const SizedBox(height: 20.0),
      
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  };
                  if (snapshot.hasData) {
                    return GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                      children: 
                        snapshot.data!.docs
                        .map((note) {
                          return noteCard((){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteReaderScreen(note)));
                          }, note);
                        }).toList(),
                        );
                  };
                  return Text("Theres no more Notes", style: GoogleFonts.nunito(
                    color: Colors.white)
                  );
                },
                
              ),
            ),
      
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteEditorScreen()));
        },
        label: const Text("Add Note"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}