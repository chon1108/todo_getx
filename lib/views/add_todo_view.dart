import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class AddTodoView extends StatelessWidget {
  AddTodoView({super.key});

  final TodoController todoControler = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(208, 3, 235, 0.898),
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
                "ชื่อสินค้า",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 219, 3, 247),
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                maxLines: 5, // Allow multiple lines for description
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    todoControler.addTodo(
                      titleController.text,
                      descriptionController.text,
                    );
                    Get.back();
                  } else {
                    Get.snackbar("Error", "Please fill out all fields",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(3, 220, 235, 0.898),
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
