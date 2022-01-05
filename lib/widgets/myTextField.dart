import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {

  const myTextField({required this.text,required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: text,
            icon: Icon(icon),
            filled: true,
            fillColor: Colors.white
        ),
      ),
    );
  }
}