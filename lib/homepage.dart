import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key : key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String dropdownvalue = 'Item 1';

  var items =[
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'

  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar :AppBar(
        title: const Text("Dropdown Lists"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.yellow,

      ),
      body : Center( 
        child : DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items : items.map((String items){
              return DropdownMenuItem( value : items, child: Text(items));
            }).toList(),
            onChanged: (String? newValue){
              setState(() {
                dropdownvalue = newValue!;
              });
            },
        ),
      ),
    );

  }


}