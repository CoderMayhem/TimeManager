import 'package:flutter/material.dart';
import 'package:timemanager/entry.dart';
import 'task.dart';
import 'task_card.dart';
import 'entry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,  this.task}) : super(key: key);

  final Task task;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Task> tasks = [

  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('Time Manager App'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TaskCard(
            task: widget.task,
          )

        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Entry()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      )
    );
  }
}






