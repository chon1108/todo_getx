import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';

class AddTodoView extends StatefulWidget {
  AddTodoView({super.key, this.todo});
  TodoModel? todo;

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final TodoController todoControler = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      descriptionController.text = widget.todo!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Todo',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(51, 14, 56, 0.894),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add Image from URL at the top of the page
              Image.network(
                'https://img.pikbest.com/illustration/20240726/nice-beautiful-nature-picture-with-water_10682206.jpg!w700wp', // Replace with your image URL
                height: 150, // Adjust the height as per your need
                width: double.infinity, // Make it full width
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
              SizedBox(height: 20),

              Text(
                widget.todo != null ? "แก้ไขรายการ" : "เพิ่มรายการ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 5, 73),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "รายละเอียด",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 199, 3, 248),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter task description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                maxLines: 5, // Allow multiple lines for description
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) return;
                  if (widget.todo != null) {
                    widget.todo!.title = titleController.text;
                    widget.todo!.description = descriptionController.text;
                    todoControler.updateTodo(widget.todo!);
                  } else {
                    todoControler.addTodo(
                      titleController.text,
                      descriptionController.text,
                    );
                  }
                  Get.back();
                  Get.snackbar("สำเร็จ", "บันทึกสำเร็จ");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(81, 11, 90, 0.894),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "บันทึก",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
