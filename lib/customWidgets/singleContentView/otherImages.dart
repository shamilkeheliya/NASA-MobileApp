import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nasa_mobileapp/utilities/sql.dart';
import 'package:http/http.dart' as http;

class OtherImagesView extends StatefulWidget {
  String url;
  OtherImagesView(this.url);
  @override
  _OtherImagesViewState createState() => _OtherImagesViewState();
}

class _OtherImagesViewState extends State<OtherImagesView> {
  API api = new API();
  List otherImages = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    http.Response response = await http.get(Uri.parse(widget.url));
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
        ? const SpinKitPouringHourGlassRefined(
            color: Colors.black,
            size: 50.0,
          )
        : Wrap(
            direction: Axis.vertical,
            children: otherImages.map((index) => Text('Item $index')).toList(),
          );
  }
}
