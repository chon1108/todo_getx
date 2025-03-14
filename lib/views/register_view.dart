import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import '../widgets/app_text_field.dart';

class Register extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สมัครสมาชิก',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // ทำให้สามารถเลื่อนหน้าได้เมื่อคีย์บอร์ดขึ้น
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'สมัครสมาชิก',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'กรุณากรอกข้อมูลเพื่อสมัครสมาชิก',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            SizedBox(height: 40),
            AppTextField(controller: emailController, label: 'อีเมล'),
            SizedBox(height: 20),
            AppTextField(
              controller: passwordController,
              label: 'รหัสผ่าน',
              obscureText: true,
            ),
            SizedBox(height: 20),
            AppTextField(
              controller: confirmPasswordController,
              label: 'ยืนยันรหัสผ่าน',
              obscureText: true,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (!GetUtils.isEmail(emailController.text)) {
                  Get.snackbar('ข้อผิดพลาด', 'กรุณากรอกอีเมลให้ถูกต้อง');
                  return;
                }
                if (passwordController.text.length < 6) {
                  Get.snackbar("Error", "กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัว");
                  return;
                }
                if (passwordController.text != confirmPasswordController.text) {
                  Get.snackbar("Error", "กรุณากรอกรหัสผ่านให้ตรงกัน");
                  return;
                }
                authController.register(
                  emailController.text,
                  passwordController.text,
                );
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // ขอบมุมโค้ง
                ),
              ),
              child: Text(
                'สมัครสมาชิก',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
