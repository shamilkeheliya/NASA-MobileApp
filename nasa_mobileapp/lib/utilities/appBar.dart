import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/utilities/const.dart';

AppBar homePageAppBar(context, theme, _scaffoldKey) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 5,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(
      'NASA',
      style: TextStyle(
        fontFamily: kMainFontFamily,
        fontSize: 30,
        color: Theme.of(context).canvasColor,
      ),
    ),
    iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
    actions: [
      IconButton(
        onPressed: () {
          _scaffoldKey.currentState.openEndDrawer();
        },
        icon: const Icon(Icons.dehaze),
      ),
    ],
  );
}
