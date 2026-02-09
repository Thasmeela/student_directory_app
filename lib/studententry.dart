import 'package:flutter/material.dart';
import 'package:student_directory_app/service.dart';

class Studententry extends StatefulWidget {
  const Studententry({super.key});

  @override
  State<Studententry> createState() => _StudententryState();
}

class _StudententryState extends State<Studententry> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController coursecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 2, 119, 178),
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text("Student Directory"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Student"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(alignment: Alignment.topLeft, child: Text("Name:")),
                    TextField(controller: namecontroller,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 218, 213, 213),
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    Align(alignment: Alignment.topLeft, child: Text("Email:")),
                    TextField(controller: emailcontroller,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 218, 213, 213),
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    Align(alignment: Alignment.topLeft, child: Text("Course:")),
                    TextField(controller: coursecontroller,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 218, 213, 213),
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: 300,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            1,
                            149,
                            217,
                          ),
                          foregroundColor: const Color.fromARGB(
                            255,
                            253,
                            250,
                            250,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          addstudent(namecontroller.text, emailcontroller.text, coursecontroller.text, context);
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 1, 119, 236),
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder(stream: getstudents(), builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        final data=snapshot.data!.docs;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["name"]),
            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data[index]["email"]),
                Text(data[index]["course"]),
              ],
            ),trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [IconButton(onPressed: () {
              
            }, icon: Icon(Icons.edit),color: Colors.green,),IconButton(onPressed: () {
              deletestudent(data[index].id, context);
            }, icon: Icon(Icons.delete),color: Colors.red,)],),
          );
        },);
      },),
    );
  }
}
