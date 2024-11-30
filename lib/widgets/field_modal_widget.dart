import 'package:flutter/material.dart';

class FieldModalWidget extends StatelessWidget {
  String hint;
  TextEditingController controller;

  FieldModalWidget({
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 14,
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          contentPadding: EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
