import 'package:flutter/material.dart';

class CustomYearTextField extends StatelessWidget {
  TextEditingController controller;
  Function(String) onChanged;
  bool visible;
  Function() onPressed;
  String hintText;

  CustomYearTextField({
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.visible,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).canvasColor,
            ),
          ),
          suffixIcon: Visibility(
            visible: visible,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.clear,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
