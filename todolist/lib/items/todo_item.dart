import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';

// ignore: must_be_immutable
class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print('Clicked on Todo Items');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: const Icon(
          Icons.check_box,
          color: Color.fromRGBO(4, 116, 254, 1),
        ),
        title: Text(
          todo.todoText!,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
              onPressed: () {
                //print('Clicked on delete icon');
                onDeleteItem(todo.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
