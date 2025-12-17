import 'dart:io';
import 'package:flutter/material.dart';
import 'homepage.dart';

class Bank{
  String bankName = 'SBI';
  String location = 'Coimbatore';
  String ifsc = 'SBI0N000123';
  String branch = 'Ganapathy';

  String name;
  int accNo;
  double _balance;

  Bank(this.name, this.accNo, this._balance);

  void deposit(double amount){
    _balance += amount;

    print('---bankName : $bankName----');
    print('---branch :  $branch----');
    print('you deposited $amount');
    checkBalance();
  }
  void withdraw(double amount){
    if(amount> _balance){
      print('insufficient balance');
    }else{
      _balance -= amount;
      print('your withdrew $amount');
      checkBalance();
    }
  }

  void checkBalance(){
    print('you balance is  : $_balance');
  }


}

class Product{
  int id;
  String name;
  double price;

  Product(this.id,this.name, this.price);

  @override
  String toString(){
    return 'ID: $id  | Name : $name | Price : $price';
  }
}

class Inventory {
  List<Product> products =[];

  void addProduct(int id, String name, double price){
    products.add(Product(id,name,price));
  }

  void showAll(){
    print('\n -- Product List --');
    products.forEach((p) => print(p));
  }

  double getTotalSum(){
    return products.fold(0,(sum,item) => sum + item.price);
  }
}


void main() {
  // Inventory store = Inventory();
  //
  // store.addProduct(1,'Biscuit', 10.0);
  //
  // store.showAll();
  runApp(const DemoApp());


}

class DemoApp extends StatelessWidget{
  const DemoApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Flutter Dropdown',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,



    );
  }
}




