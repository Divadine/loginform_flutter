import 'package:d/pratice.dart';
import 'package:flutter/material.dart';
import 'package:d/buttons.dart';
import 'package:d/floatButton.dart';
import 'package:d/BottomNavigation.dart';
import 'package:d/show_text.dart';
import 'screens/login_form.dart';
void main() async {
  //runApp(const DemoApp());
  //runApp(ButtonApp());
  //runApp(FloatButtonApp());
  //runApp(const BottomNavBar());
  //runApp(ShowText());
  WidgetsFlutterBinding.ensureInitialized(); // important
  runApp(const MyApp());
}

// class DemoApp extends StatelessWidget {
//   const DemoApp({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter dropdown Demo',
//       theme: ThemeData(
//         colorScheme: .fromSeed(seedColor: Colors.red),
//       ),
//       home: const HomePage(),
//     );
//   }
// }



// class ButtonApp extends StatelessWidget{
//   ButtonApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//         title : 'Button Demo',
//         theme : ThemeData(primaryColor: Colors.yellow),
//         home : Buttons()
//     );
//   }
//
// }

// class FloatButtonApp extends StatelessWidget{
//   FloatButtonApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: 'FloatingButtons',
//       home : FloatButtonApps(),
//       theme: ThemeData(cardColor: Colors.blue),
//     );
//   }
// }


// class BottomNavBar extends StatelessWidget{
//   static const String _title = 'Bottom Nav Bar';
//
//   const BottomNavBar({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: _title,
//       home : BotNavBar(),
//     );
//   }
// }

// class ShowText extends StatelessWidget {
//
//   const ShowText({Key? key}) : super(key:key);
//
//   @override
//   Widget build (BuildContext context){
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home : Home(),
//     );
//
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(), // open your login form
    );
  }
}