import 'dart:ui';

import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff7A64E4);

const Color secondaryColor = Color(0xff59595d);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  labelStyle: TextStyle(color: primaryColor),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:primaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);