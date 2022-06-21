import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:nasa_mobileapp/customWidgets/customElevatedButton.dart';
import 'package:nasa_mobileapp/customWidgets/singleContentView/imageView.dart';
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
  @override
  void initState() {
    super.initState();
    print(widget.data);
  }

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
          child: CustomElevatedButton(
            text: 'SAVE IMAGE',
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
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(url);
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
