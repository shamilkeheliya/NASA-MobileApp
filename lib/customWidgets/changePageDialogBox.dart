import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/customWidgets/customElevatedButton.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_mobileapp/customWidgets/dialogBoxButton.dart';

class ChangePageButtons extends StatefulWidget {
  var data;
  ChangePageButtons({required this.data});

  @override
  _ChangePageButtonsState createState() => _ChangePageButtonsState();
}

class _ChangePageButtonsState extends State<ChangePageButtons> {
  bool isVisibale = false, isPrev = false, isNext = false, isSizedBox = false;
  List list = [];
  int itemsCount = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    /// if no data
    if (widget.data == null) {
      return;
    }

    /// if have data
    setState(() {
      isVisibale = true;
    });
    list = widget.data;
    itemsCount = list.length;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      //visible: isVisibale,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isPrev,
            child: CustomElevatedButton(
              text: '< Previous',
              onPressed: () {},
            ),
          ),
          Visibility(
            visible: isSizedBox,
            child: const SizedBox(
              width: 8,
            ),
          ),
          Visibility(
            visible: isNext,
            child: CustomElevatedButton(
              text: 'Next >',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  changePage() {}
}

class ChangePageDialogBox extends StatefulWidget {
  var data, pageNumber;

  ChangePageDialogBox({
    required this.data,
    required this.pageNumber,
  });

  @override
  _ChangePageDialogBoxState createState() => _ChangePageDialogBoxState();
}

class _ChangePageDialogBoxState extends State<ChangePageDialogBox> {
  bool isPrevious = true, isNext = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DialogBoxArrowButton(
            onPressed: () {},
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
            onPressed: () {},
            visible: isNext,
            iconData: Icons.chevron_right,
          ),
        ],
      ),
    );
  }
}
