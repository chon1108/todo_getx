import 'package:get/get.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/services/storage_service.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() {
    var todos = storageService.read('todoList');
    if (todos != null) {
      todoList.value = List<TodoModel>.from(
        todos.map((x) => TodoModel.fromJson(x)),
      );
    }
  }

  void addTodo(String title, String description) {
    todoList.add(
      TodoModel(title: title, description: description, isDone: false),
    );
    storageService.write('todoList', todoList.toJson());
  }

  void toggelTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }
}
