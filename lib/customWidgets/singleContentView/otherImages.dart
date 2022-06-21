import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class OtherImagesView extends StatefulWidget {
  String jsonURL;
  Color color;
  OtherImagesView({
    required this.jsonURL,
    required this.color,
  });

  @override
  _OtherImagesViewState createState() => _OtherImagesViewState();
}

class _OtherImagesViewState extends State<OtherImagesView> {
  List otherImages = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    http.Response response = await http.get(Uri.parse(widget.jsonURL));
    if (response.statusCode == 200) {
      setState(() {
        //isLoading = false;
      });

      otherImages = jsonDecode(response.body);
      //print(otherImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return otherImages.toString() == '[]'
        ? SpinKitPouringHourGlassRefined(
            color: widget.color,
            size: 50.0,
          )
        : Wrap(
            direction: Axis.vertical,
            children: otherImages.map((index) => Text('Item $index')).toList(),
          );
  }
}
