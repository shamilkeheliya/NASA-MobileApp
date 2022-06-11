import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/utilities/const.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageTopIconsRow extends StatelessWidget {
  var theme;
  HomePageTopIconsRow({
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            theme.getTheme().brightness == Brightness.light
                ? theme.setDarkMode()
                : theme.setLightMode();
          },
          icon: Icon(
            Icons.brightness_4_outlined,
            color: Theme.of(context).canvasColor,
          ),
        ),
        IconButton(
          onPressed: () async {
            if (!await launchUrl(Uri.parse(kRepoURL))) {
              throw 'Could not launch About App';
            }
          },
          icon: Icon(
            Icons.info_outline,
            color: Theme.of(context).canvasColor,
          ),
        ),
      ],
    );
  }
}
