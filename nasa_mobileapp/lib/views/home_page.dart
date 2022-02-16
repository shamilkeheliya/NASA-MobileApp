import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/const.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'NASA',
            style: TextStyle(
              fontFamily: kMainFontFamily,
              fontSize: 30,
              color: Theme.of(context).canvasColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                theme.getTheme().brightness == Brightness.light
                    ? theme.setDarkMode()
                    : theme.setLightMode();
              },
              icon: const Icon(Icons.brightness_4_outlined),
            ),
          ],
        ),
        body: Center(),
      ),
    );
  }
}
