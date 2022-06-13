import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomDetailCard extends StatelessWidget {
  late String title, description;

  CustomDetailCard({
   required this.title,
   required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      //shadowColor: Colors.white10,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          theme: ExpandableThemeData(
            iconColor: Theme.of(context).canvasColor,
          ),
          header: Text(
            title,
            softWrap: true,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).canvasColor,
            ),
          ),
          collapsed: Text(
            description,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).canvasColor,
            ),
          ),
          expanded: Text(
            description,
            softWrap: true,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).canvasColor,
            ),
          ),
          //tapHeaderToExpand: true,
          //hasIcon: true,
        ),
      ),
    );
  }
}
