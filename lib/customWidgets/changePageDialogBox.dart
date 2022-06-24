import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_mobileapp/customWidgets/dialogBoxButton.dart';
import 'package:nasa_mobileapp/views/viewList.dart';

class ChangePageDialogBox extends StatefulWidget {
  var data, pageNumber;
  late Function(bool) isLoading;

  ChangePageDialogBox({
    required this.data,
    required this.pageNumber,
    required this.isLoading,
  });

  @override
  _ChangePageDialogBoxState createState() => _ChangePageDialogBoxState();
}

class _ChangePageDialogBoxState extends State<ChangePageDialogBox> {
  bool isVisiable = true, isPrevious = false, isNext = false;
  late String previousURL, nextURL;
  List list = [];
  int itemsCount = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    list = widget.data;
    itemsCount = list.length;

    if (itemsCount == 1) {
      if (list[0]['rel'] == 'next') {
        setState(() {
          isNext = true;
          nextURL = list[0]['href'];
          print(nextURL);
        });
      }
      if (list[0]['rel'] == 'prev') {
        setState(() {
          isPrevious = true;
          previousURL = list[0]['href'];
        });
      }
    }

    if (itemsCount == 2) {
      setState(() {
        isPrevious = true;
        isNext = true;

        if (list[0]['rel'] == 'prev') {
          previousURL = list[0]['href'];
          nextURL = list[1]['href'];
        } else {
          nextURL = list[0]['href'];
          previousURL = list[1]['href'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisiable,
      child: AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DialogBoxArrowButton(
              onPressed: () => changePage(previousURL),
              visible: isPrevious,
              iconData: Icons.chevron_left,
            ),
            Text(
              'Page ${widget.pageNumber}',
              style: TextStyle(
                color: Theme.of(context).canvasColor,
              ),
            ),
            DialogBoxArrowButton(
              onPressed: () => changePage(nextURL),
              visible: isNext,
              iconData: Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }

  changePage(String url) async {
    setState(() {
      widget.isLoading(true);
      isVisiable = false;
    });

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        widget.isLoading(false);
      });

      var data = jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewList(url, data),
        ),
      );
      //print(data);
    }
  }
}
