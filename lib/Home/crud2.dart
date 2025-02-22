import 'package:flutter/material.dart';

class Crud2 extends StatefulWidget {
  const Crud2({super.key});

  @override
  State<Crud2> createState() => _Crud2State();
}

class _Crud2State extends State<Crud2> {

  TextEditingController nameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<String> names = [];
  List<String> filterName = [];

  void createName() {}
  void updateName() {}
  void deleteName() {}
  void searchName() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Input name here ",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 11,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: createName,
                      child: Text("ADD")),
                  ElevatedButton(
                      onPressed: updateName,
                      child: Text("UPDATE"))
                ],
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller:searchController ,
              decoration: InputDecoration(
                labelText:""
              ),
            )
          ],
        ),
      ),
    );
  }
}
