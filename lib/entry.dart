import 'package:flutter/material.dart';
import 'package:timemanager/main.dart';
import 'package:timemanager/task_card.dart';
import 'task.dart';

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your TASK!"),
      ),
      body: MyForm(),
    );
  }
}
  class MyForm extends StatefulWidget{
  MyForm({Key key}) : super(key: key);

    @override
    _MyFormState createState() => _MyFormState();
  }

  class _MyFormState extends State<MyForm>{


    String _task;
    String _startTime;
    String _duration;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTask(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Task'),
      validator: (String value){
        if(value.isEmpty){
          return 'Task is required';
        }
        return null;
      },
      onSaved: (String value){
        _task = value;
      },
    );
  }

  Widget _buildStartTime(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Start Time'),
      validator: (String value){
        if(value.isEmpty){
          return 'Starting Time is required';
        }
        return null;
      },
      onSaved: (String value){
        _startTime = value;
      },
    );
  }

  Widget _buildDuration(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Duration'),
      validator: (String value){
        if(value.isEmpty){
          return 'Duration of task is required';
        }
        return null;
      },
      onSaved: (String value){
        _duration = value;
      },
    );
  }



  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTask(),
            _buildStartTime(),
            _buildDuration(),
            SizedBox(height: 10,),
            RaisedButton(
                child: Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                onPressed: ()=> {
                  if(!_formKey.currentState.validate()){
                    //do nothing
                  },
                  _formKey.currentState.save(),
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => MyHomePage(task: Task(task: _task, startTime: _startTime, duration: _duration),),
                )),
                }),
          ],
        ),
      ),
    );
  }
  }
