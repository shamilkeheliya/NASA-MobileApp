import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nasa_mobileapp/customWidgets/customFloatingActionButton.dart';
import 'package:nasa_mobileapp/customWidgets/detailsCard.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/sql.dart';
import 'package:nasa_mobileapp/utilities/background.dart';
import 'package:nasa_mobileapp/views/singleContentViewPage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ViewList extends StatefulWidget {
  late var url, data;
  ViewList(this.url, this.data);

  @override
  _ViewListState createState() => _ViewListState();
}

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

class _ViewListState extends State<ViewList> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List list = widget.data['collection']['items'];
    API api = new API();

    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        backgroundColor: Theme.of(context).primaryColor,
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Theme.of(context).primaryColor,
            body: BackgroundBody(
              theme: theme,
              child: buildBody(api, list),
            ),
            floatingActionButton: GoHomeFloatingActionButton(),
          ),
        ),
      ),
    );
  }

  FutureBuilder buildBody(api, list) {
    return FutureBuilder(
      future: api.getData(widget.url),
      builder: (BuildContext context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) => MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            onPressed: () {
              changePage(index, list[index]);
              //print(list[index]);
            },
            child: CustomDetailCard(
              title: list[index]['data'][0]['title'],
              description: list[index]['data'][0]['description'],
              image: list[index]['links'][0]['href'],
            ),
          ),
          itemCount: list.length,
        );
      },
    );
  }

  void changePage(index, data) async {
    setState(() {
      isLoading = true;
    });

    http.Response response = await http.get(Uri.parse(data['href']));
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      var imageURL = jsonDecode(response.body)[0];
      //print(imageURL);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SingleContentViewPage(
                    data: data,
                    imageURL: imageURL,
                  )));
    }
  }
}
