import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mywork extends StatefulWidget {
  const Mywork({super.key});

  @override
  State<Mywork> createState() => _MyworkState();
}

class _MyworkState extends State<Mywork> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController editController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  List<String> user = [];
  String search = '';

  void addUser() {
    setState(() {
      if (nameController.text.isNotEmpty) {
        user.add(nameController.text);
      }
    });
  }

  void deleteUser(int index) {
    setState(() {
      user.removeAt(index);
    });
  }

  void editUser(int index) {
    setState(
      () {
        if (editController.text.isNotEmpty) {
          user[index] = editController.text;
        }
      },
    );
  }

  List<String> searchUser() {
    if (search.isEmpty) {
      return user;
    }
    return user
        .where((str) => str.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final displayList = searchUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter name ',
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Enter search Text",
                  labelText: "Enter the search",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addUser();
                    nameController.clear();
                  },
                  child: const Text("Add"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      search = searchController.text;
                    });
                  },
                  child: const Text("Search"),
                ),
                if (search.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        search = '';
                        searchController.clear();
                      });
                    },
                    child: const Text("Clear Search"),
                  ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(displayList[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  editController.text = displayList[index];
                                  return CupertinoAlertDialog(
                                    content: Material(
                                      color: Colors.transparent,
                                      child: TextField(
                                        controller: editController,
                                      ),
                                    ),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          editUser(
                                              user.indexOf(displayList[index]));
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: const Text(
                                        "Are you sure want to delete"),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          deleteUser(
                                              user.indexOf(displayList[index]));
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
