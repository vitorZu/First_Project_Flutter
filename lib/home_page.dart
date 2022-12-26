// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final list = <String>[];
final controller = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite Algo Para ser Adicionado!'),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        final text = controller.text;
                        setState(() {
                          list.add(text);
                        });
                        controller.clear();
                      },
                      icon: Icon(Icons.add)),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final item = list[index];
                    return ListTile(title: Text(item));
                  },
                  itemCount: list.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
