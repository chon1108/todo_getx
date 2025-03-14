import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/services/storage_service.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();
  AuthController authController = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    var todos = await storageService.read(
      'todoList',
      authController.user.value?.uid ?? '',
    );
    if (todos != null) {
      todoList.value = List<TodoModel>.from(
        todos.map((x) => TodoModel.fromJson(x)),
      );
    }
  }

  Future<void> addTodo(String title, String description) async {
    TodoModel todo = TodoModel(
      title: title,
      description: description,
      isDone: false,
      uid: authController.user.value?.uid,
    );
    String docId = await storageService.write('todoList', todo.toJson());
    todo.docId = docId;
    todoList.add(todo);
  }

  Future<void> updateTodo(TodoModel todo) async {
    todoList.firstWhere((todo) => todo.docId == todo.docId).title;
    todoList.firstWhere((todo) => todo.docId == todo.docId).description;
    todoList.refresh();
    await storageService.update('todoList', todo.docId ?? '', todo.toJson());
  }

  void toggelTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
    storageService.update('todoList', todoList[index].docId ?? '', {
      'isDone': todoList[index].isDone,
    });
  }

  void deleteTodo(String docId) {
    todoList.removeWhere((todo) => todo.docId == docId);
    storageService.delete('todoList', docId);
  }

  void clearTodo() {
    todoList.clear();
    //  storageService.write('todos', todoList.toJson());
  }
}
