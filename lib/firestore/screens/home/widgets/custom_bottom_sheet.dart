import 'package:flutter/material.dart';

class CustomBottomSheet {
  static Future build({required BuildContext context, required String title, required TextEditingController nameController, required Function() onPressed}) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Name of Listin"),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                      onPressed: onPressed,
                      child: const Text("Save"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}