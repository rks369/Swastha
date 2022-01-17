import 'package:flutter/material.dart';
import 'package:swastha/utils/styles.dart';


class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,),
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
