import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  late String title, description;
  Color textColor;
  TextView({
    required this.title,
    required this.description,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 10,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            description,
            maxLines: 10,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
