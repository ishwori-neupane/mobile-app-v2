import 'package:flutter/material.dart';

 
 showErrorDialog(BuildContext context, String error, String description) {
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(error),
            content: Text(description),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  
                
                   Navigator.pop(context, 'Ok');
          //         Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const AskQuestion()),
          // );
                },
              ),
            ],
          );
        });
 }


