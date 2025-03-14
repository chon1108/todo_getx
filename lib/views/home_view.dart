import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/views/add_todo_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    todoController.fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'JibJob Shop',
            style: TextStyle(
              color: Color.fromARGB(255, 249, 252, 250),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(4, 207, 243, 0.9),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              todoController.clearTodo();
              authController.logout();
            },
          ),
        ],
        elevation: 10,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shop Tasks",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoController.todoList[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          todo.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (bool? newValue) {
                            todoController.toggelTodo(index);
                          },
                          activeColor: Color.fromRGBO(4, 207, 243, 0.9),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            todoController.deleteTodo(todo.docId ?? '');
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                        onTap: () {
                          Get.to(AddTodoView(todo: todo));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoView());
        },
        backgroundColor: Color.fromRGBO(4, 207, 243, 0.9),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
