import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'clima_2/lib/screens/loading_screen';

void  main(){
  runApp(const Clima2());
}

class Clima2 extends StatelessWidget{
  const Clima2({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clima 2.0",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      home: LoadingScreen(),
    );
    throw UnimplementedError();
  }
}