import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/views/register_view.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(  // ทำให้หน้าเลื่อนลงได้
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'ยินดีต้อนรับ!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'กรุณาล็อกอินเพื่อเข้าใช้งานแอป',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 40),
            AppTextField(
              label: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,  // เปลี่ยนประเภทคีย์บอร์ดเป็นอีเมล
            ),
            SizedBox(height: 20),
            AppTextField(
              label: 'Password',
              controller: passwordController,
              obscureText: true,  // ซ่อนไรส์ผ่าน
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (!GetUtils.isEmail(emailController.text)) {
                  Get.snackbar("Error", "อีเมลไม่ถูกต้อง");
                  return;
                }
                if (passwordController.text.length < 6) {
                  Get.snackbar(
                    "Error",
                    "กรุณากรอกรหัสผ่านให้ครบ อย่างน้อย 6 ตัว",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                  return;
                }
                authController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,  // ปรับสีของปุ่ม
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),  // ขอบมุมโค้ง
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(Register());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: Colors.blueAccent),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "สมัครสมาชิก",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
