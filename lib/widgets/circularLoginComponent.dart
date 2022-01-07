import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class circularLoginOption extends StatelessWidget {
  const circularLoginOption({ required this.icon});

  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: new Container(
            width: 50,
            height: 50,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: icon.image
              )
            )
        ),
      ),
    );
  }
}
