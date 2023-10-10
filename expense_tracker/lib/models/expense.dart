import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';   //tämä paketti lisättiin terminalin kautta, haettiin flutterin nettisivulta, ota $ kuva pois ennen kuin laitat terminaliin 
//paketti sisältää uuid luokan josta luodaan alla objekti
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid(); //luodaan objekti joka tallennetaan muuttujaan, tämä pakko jotta sitä voidaan käyttää luokassa

enum Category{food, travel, leisure, work}

const categoryIcons = {
  Category.food: Icon(Icons.lunch_dining), 
  Category.travel: Icon(Icons.flight_takeoff),
  Category.leisure: Icon(Icons.theater_comedy),
  Category.work: Icon(Icons.business_center_outlined)};

class Expense{
Expense({required this.title, required this.amount, required this.date, required this.category}) //tämä on constructori .tarvitaan koska muuttujat vaatii tämän
: id = uuid.v4();  

  //nänä nuuttuajat on nimettyjä parametreja
  final String id;
  final String title;
  final double amount; //tämä on hinta
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}