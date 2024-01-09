import 'package:flutter/material.dart';
//lisää paketti -> flutter pub add uuid terminalin kautta. Tämö paketti luo erilaisia id:tä
import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid(); //luodaan uusi Uuid() objekti

class Place { //luokka jossa properteina id ja title ja color
Place({
  required this.title,
  required this.image,
  this.color = Colors.white,
  }) : id = uuid.v4();

  
  final String id;
  final String title;
  final Color color;
  final File image;
}