import 'package:flutter/material.dart';
import 'package:nasa_mobileapp/views/homePage.dart';

class GoHomeFloatingActionButton extends StatelessWidget {
  const GoHomeFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      backgroundColor: Theme.of(context).canvasColor,
      child: Icon(
        Icons.home_outlined,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
