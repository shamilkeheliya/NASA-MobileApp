import 'package:flutter/material.dart';
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

class ChangePageFloatingActionButton extends StatefulWidget {
  @override
  _ChangePageFloatingActionButtonState createState() =>
      _ChangePageFloatingActionButtonState();
}

class _ChangePageFloatingActionButtonState
    extends State<ChangePageFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Go Back',
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
