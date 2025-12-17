import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class FloatButtonApps extends StatefulWidget{

  @override
  _FloatButtonState createState() => _FloatButtonState();

}

class _FloatButtonState extends State<FloatButtonApps>{
  int i =0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Text('FloatingActionButton'),
        backgroundColor: Colors.yellowAccent,
        foregroundColor: CupertinoColors.white,

      ),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[const Text('Float Button Pressed this many times'),const SizedBox(height: 10), Text(' $i')],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.back_hand),backgroundColor: Colors.red,foregroundColor: CupertinoColors.white,
          onPressed:(){
            setState(() {
              i++;
            });
          }),
    );
  }
}