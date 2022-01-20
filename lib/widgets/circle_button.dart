import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({required this.icon, required this.onpressed});
  final IconData icon;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        onPressed: onpressed,
    constraints: BoxConstraints.tightFor(
      width: 24.0,
      height: 24.0,
    ),
      shape: CircleBorder(),
    fillColor: Colors.white,
    );
  }
}
