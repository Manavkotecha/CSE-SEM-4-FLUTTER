import 'package:flutter/material.dart';

class CrudScreen extends StatefulWidget {
  @override
  _CrudScreenState createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
   TextEditingController nameController = TextEditingController();
   TextEditingController searchController = TextEditingController();
   List<String> names = [];
  List<String> filterNames = [];
  String? selectedName;

  @override
  void createName() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        names.add(nameController.text);
        filterNames = List.from(names);
        nameController.clear();
      });
    }
  }

  void updateName() {
    if (selectedName != null && nameController.text.isNotEmpty) {
      setState(() {
        final index = names.indexOf(selectedName!);
        if (index != -1) {
          names[index] = nameController.text;
          filterNames = List.from(names);
          nameController.clear();
          selectedName = null;
        }
      });
    }
  }

  void deleteName(String name) {
    setState(() {
      names.remove(name);
      filterNames = List.from(names);
      if (selectedName == name) {
        selectedName = null;
        nameController.clear();
      }
    });
  }

  void searchName(String query) {
    setState(() {
      if (query.isEmpty) {
        filterNames = List.from(names);
      } else {
        filterNames = names.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: createName,
                  child: Text('Create'),
                ),
                ElevatedButton(
                  onPressed: updateName,
                  child: Text('Update'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: searchName,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filterNames.length,
                itemBuilder: (context, index) {
                  final name = filterNames[index];
                  return ListTile(
                    title: Text(name),
                    onTap: () {
                      setState(() {
                        selectedName = name;
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
                              selectedName = name;
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
