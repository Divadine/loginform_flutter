import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Buttons extends StatefulWidget{
  const Buttons({Key? key}) : super(key : key);

  @override
  ButtonState createState() => ButtonState();
}


class ButtonState extends State<Buttons>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button for Practice Dart'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: CupertinoColors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [IconButton(iconSize: 50, icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                count++;
              });
            },

          ),
            SizedBox(height: 10),
            Text(" $count", style: TextStyle(fontSize: 50, color: Colors.red)),
          ],
        ),
      ),
    );
  }


}


