import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/imageView.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/textView.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/background.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SingleContentViewPage extends StatefulWidget {
  String index;
  var data;
  SingleContentViewPage(this.index, this.data);

  @override
  _SingleContentViewPageState createState() => _SingleContentViewPageState();
}

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

class _SingleContentViewPageState extends State<SingleContentViewPage> {
  late List otherImages;

  @override
  void initState() {
    super.initState();
    //print(widget.data['href']);
    getData();
  }

  getData() async {
    http.Response response = await http.get(Uri.parse(widget.data['href']));
    if (response.statusCode == 200) {
      setState(() {
        //isLoading = false;
      });

      otherImages = jsonDecode(response.body);
      print(otherImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        backgroundColor: Theme.of(context).primaryColor,
        body: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).primaryColor,
          body: BackgroundBody(
            theme: theme,
            child: buildBody(),
          ),
        ),
      ),
    );
  }

  ListView buildBody() {
    return ListView(
      children: [
        ImageView(
          index: widget.index,
          url: widget.data['links'][0]['href'],
        ),
        TextView(
          title: widget.data['data'][0]['title'],
          description: widget.data['data'][0]['description'],
        ),
      ],
    );
  }
}
