import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  List<User> users = [];
  List<User> filteredUsers = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterUsers);
    filteredUsers = users; // Initialize filteredUsers with all users
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    setState(() {
      filteredUsers = users
          .where((user) => user.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search by Name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      users.add(User(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                      ));
                      filteredUsers = users;
                      nameController.clear();
                      emailController.clear();
                    });
                  },
                  child: const Text('Save'),
                ),
                if (users.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      if (selectedIndex != -1) {
                        setState(() {
                          users[selectedIndex] = User(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                          );
                          filteredUsers = users;
                          nameController.clear();
                          emailController.clear();
                          selectedIndex = -1;
                        });
                      }
                    },
                    child: const Text('Update'),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: filteredUsers.isEmpty
                  ? const Text(
                'No User entered yet..',
                style: TextStyle(fontSize: 22),
              )
                  : ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filteredUsers[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(filteredUsers[index].email),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  nameController.text = filteredUsers[index].name;
                  emailController.text = filteredUsers[index].email;
                  selectedIndex = users.indexOf(filteredUsers[index]);
                });
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  users.remove(filteredUsers[index]);
                  filteredUsers = users;
                  if (selectedIndex == index) {
                    selectedIndex = -1;
                    nameController.clear();
                    emailController.clear();
                  }
                });
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}