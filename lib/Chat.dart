import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_login_project/List.dart';

class Chat extends StatefulWidget {
  final int? index;
  const Chat( {Key? key, required this.index}):super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Person ${widget.index}'),
         
        actions: [
          Icon( Icons.call),
          Icon( Icons.video_call),

        ],


      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            
          ),
        )
      ],),
      );
  }
}