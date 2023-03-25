import 'package:flutter/material.dart';
import 'package:hive_project/models/notes_models.dart';

import 'boxes/boxes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  Future<void> popUpDialog() async {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Add Notes"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: titleCtrl,
                decoration: InputDecoration(
                  hintText: 'Enter Title',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: descriptionCtrl,
                decoration: InputDecoration(
                    hintText: 'Enter Description',
                    border: OutlineInputBorder()
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Cancel')),
          TextButton(onPressed: (){
            final data = NotesModel(title: titleCtrl.text, description: descriptionCtrl.text);

            final box = Boxes.getData();
            box.add(data);
            data.save();

            titleCtrl.clear();
            descriptionCtrl.clear();
            Navigator.pop(context);
          }, child: const Text('Add')),
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Flutter'),
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        popUpDialog();
      },
      child: const Icon(Icons.add),
      ),
    );
  }

}
