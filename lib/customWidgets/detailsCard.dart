import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomDetailCard extends StatelessWidget {
  late String title, description, image;

  CustomDetailCard({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          theme: ExpandableThemeData(
            iconColor: Theme.of(context).canvasColor,
          ),
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImage(
                      imageUrl: "http://via.placeholder.com/350x150",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
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
        ),
      ),
    );
  }
}
