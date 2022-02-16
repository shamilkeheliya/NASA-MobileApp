import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        theme: theme.getTheme(),
        home: HomePage(),
      ),
    );
  }
}
