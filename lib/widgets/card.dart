import 'package:flutter/material.dart';


class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: const Icon(
          Icons.male,
          color: Colors.blue,
          size: 40.0,
        ),
            decoration: BoxDecoration(
          color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0)
      ),
      ),
    );
  }
}
