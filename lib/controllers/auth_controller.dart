import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_getx/views/home_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สำเร็จ", "สมัครสมาชิกสำเร็จ");
    } catch (e) {
      Get.snackbar("ผิดพลาด", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("สำเร็จ", "เข้าสุ่ระบบสำเร็จ");
      Get.off(HomeView());
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }
}
