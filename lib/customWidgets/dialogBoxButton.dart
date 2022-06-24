import 'package:flutter/material.dart';

class DialogBoxArrowButton extends StatelessWidget {
  late Function() onPressed;
  late bool visible;
  late IconData iconData;

  DialogBoxArrowButton({
    required this.onPressed,
    required this.visible,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Visibility(
        visible: visible,
        child: MaterialButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 50,
            width: 50,
            child: Card(
              elevation: 5,
              color: Theme.of(context).canvasColor,
              child: Icon(
                iconData,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
