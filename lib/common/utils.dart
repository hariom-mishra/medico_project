import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, bool success){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Row(
      children: [
        if(success) Icon(Icons.done), 
        if(!success) Icon(Icons.error),
        SizedBox(width: 5,),
        Text(message),
      ],
    ), duration: Duration(seconds: 2), 
    backgroundColor: success==true ? Colors.green : Colors.red,
    )
  );
}