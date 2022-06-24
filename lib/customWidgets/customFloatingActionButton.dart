import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/customWidgets/changePageDialogBox.dart';
import 'package:nasa_mobileapp/views/homePage.dart';

class GoHomeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      backgroundColor: Theme.of(context).canvasColor,
      child: Icon(
        Icons.home_outlined,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class GoBackFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      tooltip: 'Go Back',
      backgroundColor: Theme.of(context).canvasColor,
      child: Icon(
        Icons.close,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class ChangePageFloatingActionButton extends StatelessWidget {
  var data, pageNumber;

  ChangePageFloatingActionButton({
    required this.data,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data != null,
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ChangePageDialogBox(
                  data: data,
                  pageNumber: pageNumber,
                );
              });
        },
        backgroundColor: Theme.of(context).canvasColor,
        child: Text(
          'Page\n$pageNumber',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
