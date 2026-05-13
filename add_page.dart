import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage();

  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Add page - initState");
  }

  @override
  Widget build(BuildContext context) {
    print("Add page - build");
    return Scaffold(
      appBar: AppBar(title: Text("New task")),
      body: Center(
        child: Column(
          
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                
                label: Text("Add name to the task"),
              ),
              controller: _controller,
            ),),
            SizedBox(
              height: 80,
            ),
            TextButton(onPressed: _saveTask, child: Text("Save")),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("Add page - dispose");
  }

  void _saveTask(){
    Navigator.pop(context, _controller.text);
  }
}
