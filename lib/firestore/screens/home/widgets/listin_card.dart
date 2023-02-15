import 'package:flutter/material.dart';
import 'package:flutter_firebase_firestore_first/firestore/models/listin.dart';
import 'package:flutter_firebase_firestore_first/firestore/services/listins_service.dart';

import 'custom_bottom_sheet.dart';

class ListinCard extends StatefulWidget {
  const ListinCard({Key? key, required this.listin}) : super(key: key);

  final Listin listin;

  @override
  State<ListinCard> createState() => _ListinCardState();
}

class _ListinCardState extends State<ListinCard> {
  ListinsService listinsService = ListinsService();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<Listin>(widget.listin),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 16.0),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        remove(widget.listin);
      },
      child: ListTile(
        leading: const Icon(Icons.list_alt_rounded),
        title: Text(widget.listin.name),
        subtitle: Text(widget.listin.id),
        onLongPress: () {
          update(widget.listin);
        },
      ),
    );
  }

  void remove(Listin model) {
    listinsService.deleteList(id: model.id);
  }

  update(Listin model) {
    TextEditingController nameController = TextEditingController();
    nameController.text = model.name;

    CustomBottomSheet.build(
      context: context,
      title: "Updating ${model.name}",
      nameController: nameController,
      onPressed: () {
        listinsService.updateList(id: model.id, name: nameController.text);
        Navigator.pop(context);
      },
    );
  }
}
