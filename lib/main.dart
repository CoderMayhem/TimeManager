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


  static int i =0;

  List<Task> tasks = [
    Task(task: "Assignment 1", startTime: "2:00 p.m.", duration: "3 hrs"),
    Task(task: "Assignment 2", startTime: "5:00 p.m.", duration: "2 hrs")
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('Time Manager App'),
        centerTitle: true,
      ),
      body:
          dynamicList(tasks),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (context) => Entry()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      )
    );
  }

 /* _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = prefs.getInt(key) ?? 0;
    print('read: $value');
  }

  _save() async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'my_int_key';
        final value = 42;
        prefs.setInt(key, value);
        print('saved $value');
      }
  */

  Widget dynamicList(List<Task> list){

    setState(() {
      list.insert(i, widget.task);
    });

    return
        ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {

            String task = tasks[index].task.toString();
            String start = tasks[index].startTime.toString();
            String duration = tasks[index].duration.toString();
            index++;


              return Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                    Text(
                    'Task : ' + task,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    'Starting time : ' + start,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[1000]
                    ),
                  ),
                  Text(
                    'Duration : ' + duration,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800]
                    ),
                  ),
                  SizedBox(height: 6,),
                ]
                ),
              );

            },
        );

  }

}






