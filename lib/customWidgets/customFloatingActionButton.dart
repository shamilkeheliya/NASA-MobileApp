import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/customWidgets/changePageDialogBox.dart';
import 'package:nasa_mobileapp/views/homePage.dart';

class GoHomeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'goHome',
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
  late Function(bool) isLoading;

  ChangePageFloatingActionButton({
    required this.data,
    required this.pageNumber,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return data != null
        ? FloatingActionButton(
            heroTag: 'changePage',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ChangePageDialogBox(
                      data: data,
                      pageNumber: pageNumber,
                      isLoading: isLoading,
                    );
                  });
            },
            backgroundColor: Theme.of(context).canvasColor,
            child: Text(
              'Page\n$pageNumber',
              textAlign: TextAlign.center,
            ),
          )
        : const SizedBox();
  }
}
