import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

//tässä luodaan perusluokka. ei tarvita muuta kuin allaolevat class ja const + nimetyt parametrit alla id name etc. 
//Category on objekti jolle luodaan oma luokka

class GroceryItem{
  const GroceryItem({required this.id, required this.name, required this.quantity, required this.category});
  
  final String id;
  final String name;
  final int quantity;
  final Category category;
}