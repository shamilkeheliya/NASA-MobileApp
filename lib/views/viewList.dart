import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nasa_mobileapp/customWidgets/customFloatingActionButton.dart';
import 'package:nasa_mobileapp/customWidgets/detailsCard.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/sql.dart';
import 'package:nasa_mobileapp/utilities/background.dart';
import 'package:provider/provider.dart';

class ViewList extends StatefulWidget {
  late var url, data, theme;
  ViewList(this.url, this.data, this.theme);

  @override
  _ViewListState createState() => _ViewListState();
}

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

class _ViewListState extends State<ViewList> {
  @override
  Widget build(BuildContext context) {
    List list = widget.data['collection']['items'];
    //print(list.length);
    print(widget.theme);
    API api = new API();
    bool isLoading = false;

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
            floatingActionButton: const GoHomeFloatingActionButton(),
          ),
        ),
      ),
    );
  }

  FutureBuilder buildBody(api, list){
    return FutureBuilder(
      future: api.getData(widget.url),
      builder: (BuildContext context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) => MaterialButton(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            onPressed: () {},
            child: CustomDetailCard(
              title: list[index]['data'][0]['title'],
              description: list[index]['data'][0]['description'],
            ),
          ),
          itemCount: list.length,
        );
      },
    );
  }
}
