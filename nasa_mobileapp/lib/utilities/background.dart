import 'package:flutter/material.dart';

Container backgroundBody(theme, child) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: theme.getTheme().brightness == Brightness.light
            ? const AssetImage('images/lightBackground.png')
            : const AssetImage('images/darkBackground.png'),
        fit: BoxFit.cover,
        opacity: 0.3,
      ),
    ),
    child: child,
  );
}
