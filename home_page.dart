import 'package:flutter/material.dart';
import 'package:todo/add/add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tasks = [];



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
        child: 
        ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
               return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 239, 250),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Text(
        tasks[index],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
          },
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
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
}
