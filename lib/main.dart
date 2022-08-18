import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Todolist',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todoList = [];
  TextEditingController adding = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODOS'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key:Key(todoList[index]),
                      child:ListTile(title: Text('${todoList[index]}'),),onDismissed: (direction) { setState(() {
                        todoList.removeAt(index);
                      });
                  }
                      );
              },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Colors.black,
                      ),
                  itemCount: todoList.length),
            ),
          ),
          TextField(
            controller: adding,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Add task!!'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todoList.add(adding.text);
            adding.clear();
          });
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.send),
      ),
    );
  }
}
