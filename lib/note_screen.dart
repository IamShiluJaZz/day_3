import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_3/add_note_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {       //snapshot means - object
    return Scaffold(
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection('notes').where('userId',isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){       //data waiting case
          return Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError){                                             //data error case
          return Center(child: Text("Something went wrong!!!!"),);
        }
        else{
          var data = snapshot.data!.docs;      
          print(data.length);                                                   //data success
          // return ListView.builder(itemBuilder: (context, index) => Text("Data Found...."),);  // display repeated data fount text on the screen
          return ListView.builder(itemCount: data.length, itemBuilder: (context, index) {
            var note = data[index].data();     //converting current data into map - that is here now note value is Map
            return  Card(child: ListTile(
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {
                    FirebaseFirestore.instance.collection('notes').doc(data[index].id).delete();  //while clicking delete icon - delete the card ie., added note should be deleted
                    
                  }, 
                  icon: Icon(Icons.delete,color: Colors.red,),),
                  IconButton(onPressed: () {
                    
                  }, 
                  icon: Icon(Icons.update,color: Colors.red,),),
                ],
              ),    //Icon should be delete icon and mention its color for the icon
              title: Text(note["title"]),subtitle: Text(note["description"]),),);   //to view the title and description in cardview in the note screen
          },);
        }
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNoteScreen(),));      //Navigating the page to addnotescreen page 
        
      },
      child: Icon(Icons.add_comment_outlined),          //Icon seen in main page with add symbol when that icon is pressed then we can add yp new note in it
      ),
    );
  }
}