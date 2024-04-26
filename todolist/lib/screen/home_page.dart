import 'package:flutter/material.dart';
import 'package:todolist/items/todo_item.dart';

import 'package:todolist/model/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final todoList = ToDo.todoList();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handleToDoChanged(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      widget.todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      final newToDo = ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: todo,
      );
      widget.todoList.add(newToDo);
    });
  }

  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 219, 219),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 219, 219),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: const Text(
          'TO DO APP',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 40,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: const Text(
                        'TO DO LIST ',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: widget.todoList.length,
                        itemBuilder: (context, index) {
                          final todo = widget.todoList[index];
                          return ToDoItem(
                              todo: todo,
                              onToDoChanged: _handleToDoChanged,
                              onDeleteItem: _deleteToDoItem);
                        }))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                      hintText: 'Add a new todo item',
                      border: InputBorder.none),
                ),
              )),
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    )),
              )
            ]),
          )
        ],
      ),
    );
  }
}
