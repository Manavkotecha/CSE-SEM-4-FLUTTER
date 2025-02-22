import 'package:flutter/material.dart';

class myCode extends StatefulWidget {
  const myCode({super.key});

  @override
  State<myCode> createState() => _myCodeState();
}

class _myCodeState extends State<myCode> {
  TextEditingController nameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<String> filterName = [];
  List<String> names = [];
  String? selectName;

  void createName() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        names.add(nameController.text);
        filterName = List.from(names);
        nameController.clear();
      });
    }
  }

  void updateName() {
    if (selectName != null && nameController.text.isNotEmpty) {
      setState(() {
        final index = names.indexOf(selectName!);
        if (index != -1) {
          names[index] = nameController.text;
          filterName = List.from(names);
          nameController.clear();
          selectName = null;
        }
      });
    }
  }

  void deleteName(String nameToRemove) {
    setState(() {
      names.remove(nameToRemove);
      filterName = List.from(names);
      if (selectName == nameToRemove) {
        selectName = null;
        nameController.clear();
      }
    });
  }

  void searchName(String search) {
    setState(() {
      if (search.isEmpty) {
        filterName = List.from(names);
      } else {
        filterName = names
            .where((name) => name.toLowerCase().contains(search.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MY CODE")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Enter Name", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  ElevatedButton(onPressed: createName, child: Text("Create")),
                  ElevatedButton(onPressed: updateName, child: Text("Update")),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  labelText: "Search",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
              onChanged: searchName, 
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filterName.length,
                itemBuilder: (context, index) {
                  final name = filterName[index];
                  return ListTile(
                    title: Text(name),
                    onTap: () {
                      setState(() {
                        selectName = name;
                        nameController.text = name;
                      });
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            setState(() {
                              selectName = name;
                              nameController.text = name;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteName(name),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
