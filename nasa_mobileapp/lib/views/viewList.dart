import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/utilities/sql.dart';
import 'package:nasa_mobileapp/utilities/background.dart';

class ViewList extends StatefulWidget {
  late var url, data, theme;
  ViewList(this.url, this.data, this.theme);

  @override
  _ViewListState createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  @override
  Widget build(BuildContext context) {
    List list = widget.data['collection']['items'];
    //print(list.length);
    print(widget.theme);
    API api = new API();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0),
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: widget.theme == Brightness.light
        //         ? const AssetImage('images/lightBackground.png')
        //         : const AssetImage('images/darkBackground.png'),
        //     fit: BoxFit.cover,
        //     opacity: 0.3,
        //   ),
        // ),
        child: FutureBuilder(
          future: api.getData(widget.url),
          builder: (BuildContext context, snapshot) {
            return ListView.builder(
              itemBuilder: (context, index) => MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                onPressed: () {},
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpandablePanel(
                      header: Text(list[index]['data'][0]['title']),
                      collapsed: Text(
                        list[index]['data'][0]['description'],
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: Text(
                        list[index]['data'][0]['description'],
                        softWrap: true,
                      ),
                      //tapHeaderToExpand: true,
                      //hasIcon: true,
                    ),
                    // child: SizedBox(
                    //   width: double.infinity,
                    //   child: Text(list[index]['data'][0]['title']),
                    // ),
                  ),
                ),
                // child: ListTile(
                //   title: Text(list[index]['data'][0]['title']),
                // ),
              ),
              itemCount: list.length,
            );
          },
        ),
      ),
    );
  }
}
