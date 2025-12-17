import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  late String title;
  String text = "no value entered";

  void _setText(){
    setState(() {
      text = title;
    });
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('text will display'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
      ),
      body : Column(
        children: [Padding(padding: const EdgeInsets.all(50),
        child: TextField(decoration: const InputDecoration(labelText: 'Title'),
        onChanged: (value) => title=value,),),
        const SizedBox(height: 8,),
        ElevatedButton(onPressed: _setText, style:ButtonStyle(
          elevation: WidgetStateProperty.all(8),
          backgroundColor: WidgetStateProperty.all(Colors.green),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),child: const Text('submit')),
          const SizedBox(height: 20,),
          Text(text),
        ],
      ),
    );
  }
}