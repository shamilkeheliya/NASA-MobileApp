import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  var index, data;
  ImageView({
    required this.index,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Hero(
            tag: 'hero$index',
            child: CachedNetworkImage(
              imageUrl: data['links'][0]['href'],
              placeholder: (context, url) => Transform.scale(
                scale: 0.3,
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}
