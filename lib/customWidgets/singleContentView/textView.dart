import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  late String title, description;
  TextView({
    required this.title,
    required this.description,
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
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            maxLines: 10,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
