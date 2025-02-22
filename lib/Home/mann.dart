import 'package:flutter/material.dart';

class crud extends StatefulWidget {
  crud({super.key});

  @override
  State<crud> createState() => _crudState();
}

var name_list = <String>[];
var id_list = <int>[];
var emial_list = <String>[];
String message = '';

class _crudState extends State<crud>  {

  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Deleting_id = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CRUD Opration'),
          bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Add'),
                Tab(icon: Icon(Icons.star), text: 'Remove'),
                Tab(icon: Icon(Icons.settings), text: 'Update'),
                Tab(icon: Icon(Icons.search), text: 'View'),
              ]
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('AAAA kaiii kam nu nathi!!!!!!'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {},
                subtitle: Text('Hi brother!!!'),
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {},
                subtitle: Text('Hello brother!!!'),
              ),
            ],
          ),
        ),
        body:TabBarView(children: [

          //
          //add
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: id,
                  decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Email,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                  ),
                ),
              ),

              // button
              Padding(
                padding: EdgeInsets.all(12),
                child: ElevatedButton(onPressed: () {
                  setState(() {
                    message = 'Value is Added';
                  });
                  name_list.add(name.text);
                  id_list.add(int.parse(id.text));
                  emial_list.add(Email.text);
                  print(name_list);
                  print(id_list);
                  print(emial_list);
                  Text('added');
                  AlertDialog(
                    title: Text('Add'),
                    content: Text('add data to user list'),
                    actions: [
                      TextButton(onPressed: () {print('hale');}, child: Text('Yes')),
                      TextButton(onPressed: () {print('nai hale');}, child: Text('No')),
                    ],
                  );
                }, child: Text('Add')),
              ),
              //text
              Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(message)
              ),
            ],
          ),

          //
          //delete
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Deleting_id,
                  decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                  ),
                ),
              ),

              // deleting button
              Padding(
                padding: EdgeInsets.all(12),
                child: ElevatedButton(onPressed: () {
                  if(id_list.contains(int.parse(Deleting_id.text))){
                    int index = id_list.indexOf(int.parse(id.text));
                    id_list.removeAt(index);
                    name_list.removeAt(index);
                    emial_list.removeAt(index);
                    message = 'Successfully Deleted!!!';
                    print(name_list);
                    print(id_list);
                    print(emial_list);
                  }
                  else{
                    message = 'There is some problem';
                  }
                  setState(() {});
                }, child: Text('Delete')),
              ),
              //text
              Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(message)
              ),
            ],
          ),

          //
          //update
          Column(
            children: [
              //text boxes
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: id,
                  decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Email,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                  ),
                ),
              ),
              //button
              Padding(
                padding: EdgeInsets.all(12),
                child: ElevatedButton(onPressed: () {
                  if(id_list.contains(int.parse(id.text))){
                    int index = id_list.indexOf(int.parse(id.text));
                    name_list[index] = name.text;
                    id_list[index] = int.parse(id.text);
                    emial_list[index] = Email.text;
                    message = 'Successfully updated';
                    print(name_list);
                    print(id_list);
                    print(emial_list);
                  }
                  else{
                    message = 'There is some problem in it!!';
                  }
                  setState(() {});
                }, child: Text('Update')),
              ),
              //text
              Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(message)
              ),
            ],
          ),

          //
          //view
          ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: name_list.length,
            itemBuilder: (context, index) {
              return
                Container(
                    height: 70,
                    decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid),borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name is : ${name_list[index]}'),
                        Text('Email is : ${emial_list[index]}'),
                        Text('Id is : ${id_list[index]}'),
                      ],
                    )
                );
            },
          )
        ]
        ),
      ),
    );
  }
}