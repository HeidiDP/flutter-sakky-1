import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

//tämä widget ottaa listan vastaan  ja generoi listan sen listan sisällöstä

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense,});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index)=> 
      //dismissible widget on pyyhkäisy tyyli jolla voi poistaa jo syötettyjä kuluja
      Dismissible(
      key: ValueKey(expenses[index]),
      onDismissed:(direction){ onRemoveExpense(expenses[index]);
      },
      child: ExpenseItem(
        expenses[index])) ,//rullattava lista, kun käyttäjä rullaa alaspäin generoidaan widgettejä sitä mukaa
    );   
  }
}