import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.icon, required this.onpressed})
      : super(key: key);
  final IconData icon;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      constraints: const BoxConstraints.tightFor(
        width: 24.0,
        height: 24.0,
      ),
      shape: const CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
