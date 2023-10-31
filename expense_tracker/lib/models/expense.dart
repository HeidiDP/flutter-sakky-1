import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';   //tämä paketti lisättiin terminalin kautta, haettiin flutterin nettisivulta, ota $ kuva pois ennen kuin laitat terminaliin 
//paketti sisältää uuid luokan josta luodaan alla objekti
import 'package:intl/intl.dart';

final formatter = DateFormat('dMy');

const uuid = Uuid(); //luodaan objekti joka tallennetaan muuttujaan, tämä pakko jotta sitä voidaan käyttää luokassa

enum Category{food, travel, leisure, work}

const categoryIcons = {
  Category.food: Icons.lunch_dining, 
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.theater_comedy,
  Category.work: Icons.business_center_outlined};

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
//pitää sisällään kategorian ja kaikki sen kategorian ostokset
class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

//suodatttaa listan ostoksia ja tallentaa vain oikean kategorian ostokset
ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) 
: expenses = allExpenses.where((expense) => expense.category == category).toList();  //vertailuoperaatio säilytetäänkö vai ei

final Category category;
final List<Expense> expenses;

//ostoksien summa
double get totalExpenses{
  double sum = 0;

  //lasketaan summa
//for(int i = 0; i < expenses.length; i++) {} -> tätä voisi käyttää myös
for(final expense in expenses){

sum += expense.amount;
}
  return sum;
}

}