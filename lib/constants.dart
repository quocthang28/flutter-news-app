import 'package:flutter/material.dart';

const apiKey = '7962813510be466b82511b87e57c4574';

const kCategoryNameTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  shadows: [
    Shadow(
        // bottomLeft
        offset: Offset(-1.5, -1.5),
        color: Colors.black),
    Shadow(
        // bottomRight
        offset: Offset(1.5, -1.5),
        color: Colors.black),
    Shadow(
        // topRight
        offset: Offset(1.5, 1.5),
        color: Colors.black),
    Shadow(
        // topLeft
        offset: Offset(-1.5, 1.5),
        color: Colors.black),
  ],
);
