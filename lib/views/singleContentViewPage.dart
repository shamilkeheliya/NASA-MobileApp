import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/imageView.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/otherImages.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/textView.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/background.dart';
import 'package:provider/provider.dart';

class SingleContentViewPage extends StatefulWidget {
  String index;
  var data;
  SingleContentViewPage(this.index, this.data);

  @override
  _SingleContentViewPageState createState() => _SingleContentViewPageState();
}

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

class _SingleContentViewPageState extends State<SingleContentViewPage> {
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
          data: widget.data,
        ),
        TextView(
          title: widget.data['data'][0]['title'],
          description: widget.data['data'][0]['description'],
          textColor: Theme.of(context).canvasColor,
        ),
      ],
    );
  }
}
