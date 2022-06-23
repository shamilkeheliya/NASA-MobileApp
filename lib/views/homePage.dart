import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nasa_mobileapp/customWidgets/customElevatedButton.dart';
import 'package:nasa_mobileapp/customWidgets/homePageTopIcons.dart';
import 'package:nasa_mobileapp/customWidgets/yearTestField.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/background.dart';
import 'package:nasa_mobileapp/views/viewList.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchKey = '';
  String year_start = '';
  String year_end = '';

  bool isValidate = false;
  bool isLoading = false;
  bool showFilters = false;

  TextEditingController searchKeyTEC = TextEditingController();
  TextEditingController year_startTEC = TextEditingController();
  TextEditingController year_endTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        backgroundColor: Theme.of(context).primaryColor,
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: BackgroundBody(
              theme: theme,
              child: buildBody(theme),
            ),
          ),
        ),
      ),
    );
  }

  Column buildBody(theme) {
    return Column(
      children: [
        HomePageTopIconsRow(theme: theme),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(50),
                            child: Image(
                              image: AssetImage('images/logo.png'),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                searchKey = value;
                              });
                            },
                            autofocus: false,
                            style:
                                TextStyle(color: Theme.of(context).canvasColor),
                            controller: searchKeyTEC,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              errorText:
                                  isValidate ? 'Cannot Search Empty' : null,
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
                                    searchKeyTEC.clear();
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
                          Visibility(
                              visible: !showFilters, child: searchButton()),
                          Visibility(
                              visible: !showFilters,
                              child: const SizedBox(height: 20)),
                          showFilters
                              ? buildFilter()
                              : TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showFilters = true;
                                    });
                                  },
                                  child: const Text('Show Filters'),
                                ),
                          Visibility(
                              visible: showFilters,
                              child: const SizedBox(height: 20)),
                          Visibility(
                              visible: showFilters, child: searchButton()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  CustomElevatedButton searchButton() {
    return CustomElevatedButton(
        onPressed: () {
          setState(() {
            isValidate = searchKeyTEC.text.isEmpty ? true : false;
          });
          if (searchKeyTEC.text.isNotEmpty) {
            changePage(searchKey);
          }
        },
        text: 'SEARCH');
  }

  Visibility buildFilter() {
    return Visibility(
      visible: showFilters,
      child: Row(
        children: [
          CustomYearTextField(
            hintText: 'Start Year',
            controller: year_startTEC,
            onChanged: (value) {
              setState(() {
                year_start = value;
              });
            },
            visible: year_start != '',
            onPressed: () {
              year_startTEC.clear();
              setState(() {
                year_start = '';
              });
            },
          ),
          const SizedBox(width: 10),
          CustomYearTextField(
            hintText: 'End Year',
            controller: year_endTEC,
            onChanged: (value) {
              setState(() {
                year_end = value;
              });
            },
            visible: year_end != '',
            onPressed: () {
              year_endTEC.clear();
              setState(() {
                year_end = '';
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> changePage(searchKey) async {
    setState(() {
      isLoading = true;
    });

    var url;

    if (year_startTEC.text.isNotEmpty && year_endTEC.text.isNotEmpty) {
      url = Uri.https(
        'images-api.nasa.gov',
        '/search',
        {
          "q": searchKey,
          "year_start": year_start,
          "year_end": year_end,
          "media_type": "image",
        },
      );
    } else if (year_startTEC.text.isNotEmpty && year_endTEC.text.isEmpty) {
      url = Uri.https(
        'images-api.nasa.gov',
        '/search',
        {
          "q": searchKey,
          "year_start": year_start,
          "media_type": "image",
        },
      );
    } else if (year_startTEC.text.isEmpty && year_endTEC.text.isNotEmpty) {
      url = Uri.https(
        'images-api.nasa.gov',
        '/search',
        {
          "q": searchKey,
          "year_end": year_end,
          "media_type": "image",
        },
      );
    } else {
      url = Uri.https(
        'images-api.nasa.gov',
        '/search',
        {
          "q": searchKey,
          "media_type": "image",
        },
      );
    }

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });

      var data = jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewList(url, data),
        ),
      );
      //print(data);
    }
  }
}
