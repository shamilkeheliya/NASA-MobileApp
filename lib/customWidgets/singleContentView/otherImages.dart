import 'dart:convert';

import 'package:flutter/material.dart';
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
        ? const SizedBox() //: SizedBox();
        : FutureBuilder(
            future: api.getData(''),
            builder: (BuildContext context, snapshot) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  onPressed: () {
                    //changePage(index, list[index]);
                    //print(list[index]['links'][0]['href']);
                  },
                  child: Container(
                    child: Text('Shamil'),
                  ),
                ),
                itemCount: otherImages.length,
              );
            },
          );
  }
}
