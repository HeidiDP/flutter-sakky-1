import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

//tämä widget ottaa listan vastaan  ja generoi listan sen listan sisällöstä

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index)=> 
      ExpenseItem(expenses[index]),//rullattava lista, kun käyttäjä rullaa alaspäin generoidaan widgettejä sitä mukaa
    );   
  }
}