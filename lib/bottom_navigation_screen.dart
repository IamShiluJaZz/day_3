import 'package:day_3/note_screen.dart';
import 'package:day_3/profilescreen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  List pages =  [
    NoteScreen(),Profilepage()

  ];

  int selectedindex =  0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[selectedindex],

      bottomNavigationBar: BottomNavigationBar(
        
        onTap:(value) {
          setState(() {
            selectedindex =  value;
          });  
        },

        items: [

        BottomNavigationBarItem(icon: Icon(Icons.note),label: 'Note'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
      ]),
    );
  }
}