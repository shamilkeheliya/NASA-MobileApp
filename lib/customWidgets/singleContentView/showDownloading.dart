import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowDownloading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).canvasColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Downloading',
            style: TextStyle(
              //fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SpinKitThreeBounce(
            color: Theme.of(context).primaryColor,
            size: 10.0,
          ),
        ],
      ),
    );
  }
}
