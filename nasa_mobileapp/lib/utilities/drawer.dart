import 'package:flutter/material.dart';

ClipRRect homePageDrawer(context, theme) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(100), bottomLeft: Radius.circular(180)),
    child: SizedBox(
      width: 180,
      height: 350,
      child: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            const SizedBox(height: 60),
            ListTile(
              leading: Icon(
                Icons.brightness_4_outlined,
                color: Theme.of(context).canvasColor,
              ),
              title: Text(
                'Appearance',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              onTap: () {
                theme.getTheme().brightness == Brightness.light
                    ? theme.setDarkMode()
                    : theme.setLightMode();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star_outline,
                color: Theme.of(context).canvasColor,
              ),
              title: Text(
                'Feedback',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Theme.of(context).canvasColor,
              ),
              title: Text(
                'About App',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    ),
  );
}
