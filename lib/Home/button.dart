import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class button extends StatelessWidget {
  const button({super.key});

  @override
  Widget build(BuildContext context) {

    var names = ['manav','zeel','harshil','harshvi','jasmin','sata'];
    var time = DateTime.now();

    return Scaffold(
      appBar: AppBar(),
      // Button
      // body: TextButton(
      // // we also use OutlinedButton or ElevatedButton
      // child: Text("click"),
      //   onPressed: (){
      //     print('text button');
      //   },
      // ),
      // body: Image.asset('assets/images/Screenshot 2024-04-04 221356.png'),

      //Inkwell
      // body: Center(
      //   child: InkWell(
      //     onTap: () {
      //       print("Clicked");
      //     },
      //     child: Container(
      //       height: 100,
      //       width: 100,
      //       color: Colors.red,
      //       child: Center(
      //           child: InkWell(
      //             onTap: (){
      //               print("Click on center text");
      //             },
      //               child: const Text(
      //         "Click Here",//don't know where i click to print
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.w400,
      //         ),
      //       ))),
      //     ),
      //   ),
      // ),

      //Scroll View
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(right: 5.0),
      //           child: SingleChildScrollView(
      //             scrollDirection: Axis.horizontal,
      //             child: Row(
      //               children: [
      //                 Container(
      //                   height: 200,
      //                   width: 200,
      //                   margin: EdgeInsets.only(bottom: 11),
      //                   color: Colors.blue,
      //                 ),
      //                 Container(
      //                   height: 200,
      //                   width: 200,
      //                   margin: EdgeInsets.only(bottom: 11),
      //                   color: Colors.green,
      //                 ), Container(
      //                   height: 200,
      //                   width: 200,
      //                   margin: EdgeInsets.only(bottom: 11),
      //                   color: Colors.red,
      //                 ), Container(
      //                   height: 200,
      //                   width: 200,
      //                   margin: EdgeInsets.only(bottom: 11),
      //                   color: Colors.amber,
      //                 ),
      //
      //
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: 200,
      //           margin: EdgeInsets.only(bottom: 11),
      //           color: Colors.green,
      //         ),
      //         Container(
      //           height: 200,
      //           margin: EdgeInsets.only(bottom: 11),
      //           color: Colors.red,
      //         ),
      //         Container(
      //           height: 200,
      //           margin: EdgeInsets.only(bottom: 11),
      //           color: Colors.orange,
      //         ),
      //         Container(
      //           height: 200,
      //           margin: EdgeInsets.only(bottom: 11),
      //           color: Colors.grey,
      //         ),
      //         Container(
      //           height: 200,
      //           margin: EdgeInsets.only(bottom: 11),
      //           color: Colors.lime,
      //         ),Container(
      //           height: 200,
      //           margin: EdgeInsets.only(bottom: 11),
      //           color: Colors.deepPurple,
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // ),

      //listview
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   reverse: true,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("One",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("Two",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("Three",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("Four",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("Five",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      //     )
      //
      //   ],
      // ),

      //listview components we have .builder ,.separated

      // body: ListView.builder(itemBuilder:(context, index) {
      //   return Text(names[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),);
      //   },
      // itemCount: names.length,
      //   itemExtent: 51,
      //   scrollDirection: Axis.vertical,
      // ),

      // body: ListView.separated(itemBuilder:(context, index) {
      //   return Text(names[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),);
      // },
      //   itemCount: names.length,
      //   scrollDirection: Axis.vertical,
      //   separatorBuilder: (context,index){
      //   return Divider(height: 50,);
      //   },
      // ),

      // list tile and listview
      //   body: ListView.separated(itemBuilder:(context, index) {
      //   return ListTile(
      //      leading:Text('${index+1}') ,
      //      title: Text(names[index]),
      //      subtitle:Text("Number"),
      //      trailing:Icon(Icons.add)
      //
      //   );
      // },
      //   itemCount: names.length,
      //   separatorBuilder: (context,index){
      //   return Divider(height: 20,thickness: 1,);
      //   }
      //
      //   )

      // body:CircleAvatar(
      //   backgroundImage: AssetImage('assets/image/Screenshot 2024-04-04 221356.png'),
      // ) ,

      //   inout textfield
      // body:TextField(
      //   decoration: InputDecoration(
      //     focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(10),
      //       borderSide: BorderSide(
      //         color: Colors.green;
      //       )
      //
      //     )
      //   ),
      // )


      // body:Center(
      //   child: Container(
      //     height: 200,
      //     width: 200,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text('$time'),
      //         ElevatedButton(onPressed: (){
      //
      //         }, child:Text("Current Time:$DateFormat('Hms').format()" )
      //         )],
      //     ),
      //   ),
      // ),

      //Date Picker

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Choose Date",style:TextStyle(fontWeight: FontWeight.w500)),
      //       ElevatedButton(
      //         onPressed: () async {
      //           DateTime now = DateTime.now();
      //           DateTime lastDate = DateTime(2024, 1, 1);
      //           DateTime initialDate = now.isAfter(lastDate) ? lastDate : now;
      //
      //           DateTime? datePicked = await showDatePicker(
      //             context: context,
      //             initialDate: initialDate,
      //             firstDate: DateTime(2020),
      //             lastDate: lastDate,
      //           );
      //
      //           if (datePicked != null) {
      //             print("Date Selected: ${datePicked.day}-${datePicked.month}-${datePicked.year}");
      //           }
      //         },
      //         child: Text("Click here"),
      //       ),
      //     ],
      //   ),
      // ),

      //Grid View
      
        // body: Column(
        //   children: [
        //     Container(
        //       height: 200,
        //       child: GridView.count(crossAxisCount: 4,
        //       crossAxisSpacing: 15,
        //       mainAxisSpacing: 15,
        //       children: [
        //         Container(color: Colors.amber,),
        //         Container(color: Colors.cyan,),
        //         Container(color: Colors.teal,),
        //         Container(color: Colors.blue,),
        //         Container(color: Colors.black,),
        //         Container(color: Colors.brown,),
        //         Container(color: Colors.deepPurple,),
        //         Container(color: Colors.deepOrange,)
        //
        //       ],),
        //     ),
        //     Container(height: 100,),
        //
        //     Container(
        //       height: 200,
        //       child: GridView.extent(maxCrossAxisExtent:50,
        //         crossAxisSpacing: 15,
        //         mainAxisSpacing: 15,
        //         children: [
        //           Container(color: Colors.amber,),
        //           Container(color: Colors.cyan,),
        //           Container(color: Colors.teal,),
        //           Container(color: Colors.blue,),
        //           Container(color: Colors.black,),
        //           Container(color: Colors.brown,),
        //           Container(color: Colors.deepPurple,),
        //           Container(color: Colors.deepOrange,)
        //
        //         ],),
        //     ),
        //   ],
        // ),

      //here for change color we use array we make different color array and use in color :color[index] and color.length in itemCount
      // body: GridView.builder( itemBuilder: (context, index) {
      //   return Container(color: Colors.deepOrange,);
      // },itemCount: 8,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),),.

      // body:Stack(
      //   children: [
      //     Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.blue,
      //
      //     ),
      //     Positioned(
      //       left:20,
      //       right: 20,
      //       bottom: 20,
      //       top: 20,
      //       child: Container(
      //         width: 160,
      //         height: 160,
      //         color: Colors.green,
      //
      //       ),
      //     ),
      //     Positioned(
      //       left:45,
      //       right: 45,
      //       bottom: 45,
      //       top: 45,
      //       child: Container(
      //         width: 120,
      //         height: 120,
      //         color: Colors.yellowAccent,
      //
      //       ),
      //     )
      //
      //   ],
      // ),

      // instead of this we use rich text so it was be easy to implement
      // body: Row(
      //   children: [
      //     Text("Hello",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight:FontWeight.bold),),
      //     Text("World",style:TextStyle(fontSize: 34,color:Colors.blue,fontWeight: FontWeight.bold),)
      //   ],
      // ),
      // body:RichText(
      //     text:TextSpan(
      //         style:TextStyle(color: Colors.grey,fontSize: 32),
      //         children: [
      //           TextSpan(text: "Hello ",),
      //           TextSpan(text: "World",style: TextStyle(fontSize: 34,color: Colors.blue,fontWeight: FontWeight.bold)),
      //           TextSpan(text: "   Welcome to ",),
      //           TextSpan(text: "Flutter",style: TextStyle(fontSize: 43,color: Colors.orange,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: 'Montserrat'))
      //         ]
      //     )
      // ),

      //icon
      // body: Center(
      //     child:Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(
      //           Icons.add_alert_sharp,size:52,color: Colors.yellow,
      //         ),
      //         FaIcon(FontAwesomeIcons.amazon)
      //       ],
      //     )
      // ),

      


    );
  }
}

