import 'package:flutter/material.dart';
class Place {
const Place({
  required this.id,
  required this.title,
  this.color = Colors.white,
  });

  
  final String id;
  final String title;
  final Color color;
}