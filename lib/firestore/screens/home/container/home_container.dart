import 'package:flutter/material.dart';
import 'package:flutter_firebase_firestore_first/firestore/models/listin.dart';
import 'package:flutter_firebase_firestore_first/firestore/screens/common/error_screen.dart';
import 'package:flutter_firebase_firestore_first/firestore/screens/common/failure.dart';
import 'package:flutter_firebase_firestore_first/firestore/screens/common/loading_screen.dart';
import 'package:flutter_firebase_firestore_first/firestore/screens/home/home_screen.dart';
import 'package:flutter_firebase_firestore_first/firestore/services/listins_service.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final ListinsService listinsService = ListinsService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Listin>>(
      stream: listinsService.getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }
        if (snapshot.hasData) {
          return HomeScreen(list: snapshot.data!);
        }
        if (snapshot.hasError) {
          return ErrorScreen(error: (snapshot.error as Failure).message!);
        }
        return Container();
      },
    );
  }
}
