import 'package:flutter/material.dart';

import 'task.dart';

class TaskCard extends StatelessWidget {

  final Task task;
  //final Function delete;
  //final Function add;
  TaskCard({this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              task.task,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 6,),
            Text(
              task.startTime,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[800]
              ),
            ),
            Text(
              task.duration,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 6,),
            FlatButton.icon(
                //onPressed: delete,
                label: Text("DELETE"),
                icon: Icon(Icons.delete),
                )
          ],
        ),
      ),
    );
  }
}