class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo> todoList() {
    return [
      ToDo(id: '1', todoText: 'Morning Walk', isDone: true),
      ToDo(id: '2', todoText: 'Meditation', isDone: true),
      ToDo(
        id: '3',
        todoText: 'Assignments',
      ),
      ToDo(
        id: '4',
        todoText: 'Buy Groceries',
      ),
      ToDo(
        id: '5',
        todoText: 'Check Mails',
      ),
      ToDo(
        id: '6',
        todoText: 'Gym',
      ),
      ToDo(
        id: '7',
        todoText: 'Internship',
      ),
    ];
  }
}
