import 'package:flutter/material.dart';
import '../screens/home.dart';
import './constant.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Users Information',
      theme: ThemeData(fontFamily: "Cairo",
      scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),),
    
      home: const Home(),
    );
  }
}



