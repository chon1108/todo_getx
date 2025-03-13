import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  // เพิ่มการตั้งค่าใหม่สำหรับ obscureText (การซ่อนตัวอักษร) และ keyboardType
  AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false, // เริ่มต้นเป็น false
    this.keyboardType = TextInputType.text, // ค่าเริ่มต้นเป็น text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText, // ซ่อนตัวอักษรถ้า obscureText เป็น true
          keyboardType: keyboardType, // ตั้งค่าประเภทคีย์บอร์ด
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // ขอบมุมโค้ง
            ),
            filled: true,
            fillColor: Colors.blue, // สีพื้นหลังอ่อน
            hintText: label, // ใส่คำแนะนำในกรณีที่ไม่มีข้อความ
            hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.6)),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
