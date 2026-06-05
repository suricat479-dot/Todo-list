import 'package:flutter/material.dart';
import 'package:todo/add/add_page.dart';
import 'package:todo/database/todo.dart';
import 'package:todo/settings/settings_page.dart';
//import 'package:todo/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, 
   required this.title,
    required this.onToggleTheme,});

  final String title;
  final Function(bool) onToggleTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    ThemeMode themeMode = ThemeMode.light;

  
  List<String> tasks = [];

  List<Todo> todoList = [
    //mock-data
    Todo(id: 1, title: "make dinner", isDone: true, createdAt: "01/03/2026"),
    Todo(id: 2, title: "make lunch", isDone: true, createdAt: "02/03/2026"),
    Todo(id: 3, title: "do hw", isDone: false, createdAt: "23/09/2026"),
    Todo(id: 4, title: "buy new clothes", isDone: false, createdAt: "16/10/2027",),
  ];
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Home page - initState");
  }

  @override
  Widget build(BuildContext context) {
    print("Home page - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final title = todoList[index].title;
            return Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(16),

              decoration: BoxDecoration(
                
                color: themeMode == ThemeMode.light
              ? Color.fromARGB(255, 243, 239, 250) 
              : Color.fromRGBO(77, 75, 80, 1),
                borderRadius: BorderRadius.circular(15),
              ),

              child: ListTile(
                
              title: Text(title),

              
              )
            );
            
          },
        ),
      
      ),

    

      persistentFooterButtons: [
        FloatingActionButton(
        onPressed: _navigateToSettingsPage,
        child: const Icon(Icons.settings),
      ),
      FloatingActionButton(onPressed: _navigateToAddPage,
      child:  const Icon(Icons.add),)
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("Home page - dispose");
  }

  void _navigateToAddPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPage()),
    );
    if (result != null) {
      print("$result");
    }
    if (result != null && result.toString().isNotEmpty) {
      setState(() {
        tasks.insert(0, result);
      });
    }
  }

  void _navigateToSettingsPage() async {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage(
        onToggleTheme: widget.onToggleTheme,)));
  }
}
