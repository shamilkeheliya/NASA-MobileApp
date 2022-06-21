import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageView extends StatefulWidget {
  var url;
  ImageView({
    required this.url,
  });

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: widget.url,
            placeholder: (context, url) => SpinKitDualRing(
              color: Theme.of(context).canvasColor,
              size: 50.0,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
