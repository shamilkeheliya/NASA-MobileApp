import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:nasa_mobileapp/customWidgets/customElevatedButton.dart';
import 'package:nasa_mobileapp/customWidgets/customFloatingActionButton.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/customSnackBar.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/imageView.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/showDownloading.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/textView.dart';
import 'package:nasa_mobileapp/themeData/theme_manager.dart';
import 'package:nasa_mobileapp/utilities/background.dart';
import 'package:provider/provider.dart';

class SingleContentViewPage extends StatefulWidget {
  String imageURL;
  var data;
  SingleContentViewPage({
    required this.data,
    required this.imageURL,
  });

  @override
  _SingleContentViewPageState createState() => _SingleContentViewPageState();
}

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

class _SingleContentViewPageState extends State<SingleContentViewPage> {
  bool isDownloading = false;

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
          floatingActionButton: GoBackFloatingActionButton(),
        ),
      ),
    );
  }

  ListView buildBody() {
    return ListView(
      children: [
        TextView(
          title: widget.data['data'][0]['title'],
          description: widget.data['data'][0]['description'],
          date_created: widget.data['data'][0]['date_created'],
          textColor: Theme.of(context).canvasColor,
        ),
        ImageView(
          url: widget.imageURL,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: isDownloading
              ? ShowDownloading()
              : CustomElevatedButton(
                  text: 'DOWNLOAD IMAGE',
                  onPressed: () {
                    downloadImage(widget.imageURL);
                  },
                ),
        ),
      ],
    );
  }

  downloadImage(url) async {
    try {
      setState(() {
        isDownloading = true;
      });

      String s = url;
      int idx = s.indexOf(":");
      String downloadURL = 'https:${s.substring(idx + 1).trim()}';

      /// Download image
      var imageId = await ImageDownloader.downloadImage(downloadURL);

      if (imageId == null) {
        setState(() {
          isDownloading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(failedSnackBar());
        return;
      }

      /// if success
      setState(() {
        isDownloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(successfulSnackBar());
    } on PlatformException catch (error) {
      setState(() {
        isDownloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(failedSnackBar());
      print(error);
    }
  }
}
