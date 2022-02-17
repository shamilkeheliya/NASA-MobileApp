import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/appBar.dart';
import 'package:nasa_mobileapp/utilities/background.dart';
import 'package:nasa_mobileapp/utilities/drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchKey = '';
  bool isValidate = false;
  TextEditingController searchKeyTEC = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: homePageAppBar(context, theme, _scaffoldKey),
        body: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Theme.of(context).primaryColor,
          endDrawer: homePageDrawer(context, theme),
          body: backgroundBody(
            theme,
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            searchKey = value;
                          });
                        },
                        autofocus: true,
                        style: TextStyle(color: Theme.of(context).canvasColor),
                        controller: searchKeyTEC,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          errorText: isValidate ? 'Cannot Search Empty' : null,
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                          suffixIcon: Visibility(
                            visible: searchKey != '',
                            child: IconButton(
                              onPressed: () {
                                searchKeyTEC.clear;
                                setState(() {
                                  searchKey = '';
                                });
                              },
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(context).canvasColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).canvasColor,
                        ),
                        child: Text(
                          'SEARCH',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
