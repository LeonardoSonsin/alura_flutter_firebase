import 'package:flutter/material.dart';
import 'package:flutter_firebase_firestore_first/firestore/models/listin.dart';
import 'package:flutter_firebase_firestore_first/firestore/screens/home/widgets/custom_bottom_sheet.dart';
import 'package:flutter_firebase_firestore_first/firestore/screens/home/widgets/listin_card.dart';
import 'package:flutter_firebase_firestore_first/firestore/services/analytics_service.dart';
import 'package:flutter_firebase_firestore_first/firestore/services/listins_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.list});

  final List<Listin> list;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AnalyticsService analyticsService = AnalyticsService();
  ListinsService listinsService = ListinsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: widget.list.isEmpty ? emptyBody() : listView(),
      floatingActionButton: myFab(),
    );
  }

  AppBar myAppBar() => AppBar(title: const Text("Listin"));

  Center emptyBody() {
    return const Center(
      child: Text(
        "No list yet.\n Lets create the first one?",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget listView() {
    return ListView.separated(
      itemCount: widget.list.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) => ListinCard(listin: widget.list[index]),
    );
  }

  FloatingActionButton myFab() {
    return FloatingActionButton(
      onPressed: () {
        create();
      },
      child: const Icon(Icons.add),
    );
  }

  create() {
    TextEditingController nameController = TextEditingController();

    CustomBottomSheet.build(
      context: context,
      title: "New Listin",
      nameController: nameController,
      onPressed: () {
        listinsService.addNewList(name: nameController.text);
        analyticsService.updateAnalytics(field: 'added_lists');
        Navigator.pop(context);
      },
    );
  }
}
