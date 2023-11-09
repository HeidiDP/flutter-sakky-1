import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

//tämä widget ottaa listan vastaan  ja generoi listan sen listan sisällöstä
//LISTVIEW TÄÄLLÄ KÄYTÖSSÄ
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense,});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index)=> Dismissible(
      //dismissible widget on pyyhkäisy tyyli jolla voi poistaa jo syötettyjä kuluja
      key: ValueKey(expenses[index]),
      background: Container(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),       //error olisi punainen väri, onBackground on tumma
        margin: EdgeInsets.symmetric(
          horizontal: Theme.of(context).cardTheme.margin!.horizontal  //huom ! luvataan että ko horizontal teema löytyy joten se on oltava määriteltynä
        ),
      ), 
      onDismissed:(direction){ onRemoveExpense(expenses[index]);
      },
      child: ExpenseItem(
        expenses[index])) ,//rullattava lista, kun käyttäjä rullaa alaspäin generoidaan widgettejä sitä mukaa
    );   
  }
}

//Jos vanhempi widget kuten column ja sillä lapsi esim listvoiew. column ei rajoita sen lapsien korkeuut ja listview preferense
//on ääretön korkeus. lopputuloksen aon ääretön korkeus listview widgetille joka on mahdoton toteuttaa 

