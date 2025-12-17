import 'package:flutter/material.dart';

class BotNavBar extends StatefulWidget {
  BotNavBar({super.key});

  @override
  _MyNavBar createState() => _MyNavBar();

}


class _MyNavBar extends State<BotNavBar> {
  int _selectedIndex = 0;

  List<Widget>  _widgetOptions = <Widget>[
    Text('Home Page', selectionColor: Colors.yellow),
    Text('Course Page', selectionColor: Colors.yellow),
    Text('Contact Page', selectionColor: Colors.yellow,)
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Text('Nav Bar Buttons', style: TextStyle(color: Colors.white,)
        ),
        backgroundColor: Colors.yellow,
      ),
      
      body : Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label :'Home'),
        BottomNavigationBarItem(icon : Icon(Icons.book), label :'book'),
        BottomNavigationBarItem(icon : Icon(Icons.contact_mail), label:'Mail'),
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),

        
      
    );

    
  }
  
}