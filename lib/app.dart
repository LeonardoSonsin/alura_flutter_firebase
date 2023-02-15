import 'package:flutter/material.dart';
import 'firestore/screens/home/container/home_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alura Flutter with Firebase',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeContainer(),
    );
  }
}
