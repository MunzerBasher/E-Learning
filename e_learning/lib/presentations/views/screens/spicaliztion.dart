import 'package:e_learning/domain/classes/subjects.dart';
import 'package:e_learning/presentations/views/screens/subjects.dart';
import 'package:flutter/material.dart';

class Spicaliztion extends StatelessWidget {
  const Spicaliztion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i = 0; i < SubjectsList.spicaliztion.length; i++)
              InkWell(
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(builder: (_) =>  Subjects(id: SubjectsList.spicaliztion.entries.elementAt(i).value,))),
                child: Container(
                  
                  margin: EdgeInsets.all(MediaQuery.of(context).size.height/50),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  height: MediaQuery.of(context).size.height/20,
                  width: MediaQuery.of(context).size.width/4,
                  child: Center(child: Text(SubjectsList.spicaliztion.entries.elementAt(i).key)),
                  
                  ),
              ),
          ],
        ),
      )),
    );
  }
}