import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart'; 


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

final List<Expense> _registeredExpenses = [
  Expense(
    title: 'Vöner 300g', 
    amount: 2.99, 
    date: DateTime.now(), 
    category: Category.food),
  Expense(
    title: 'Theater', 
    amount: 19.99, 
    date: DateTime.now(), 
    category: Category.leisure)
];

//tehdään funktio joka sijoitetaan appbarin add iconbuttoniin _ ->eteen on private funktio
void _openAddExpenseOverlay(){
  //showmodal.. on funktio(meidän funktion sisällä)builden määrittelee miltä se visuaalisesti näyttää
showModalBottomSheet(
  isScrollControlled: true,
  context: context, 
  builder: (ctx)=>  NewExpense(
  onAddExpense: _addExpense));
}

void _addExpense(Expense expense){ //funktiolle annetaan parametrinä Expense expense 
setState(() {
  _registeredExpenses.add(expense);
  
});
}
void _removeExpense(Expense expense){
  final expenseIndex = _registeredExpenses.indexOf(expense);

setState(() {
  _registeredExpenses.remove(expense);
});
//poiston peruutus
ScaffoldMessenger.of(context).clearSnackBars();
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    duration: const Duration(seconds: 3),
    content: const Text('Expense deleted.'),
    action: SnackBarAction(label: 'Undo', 
    onPressed: (){
        //datan poiston peruutus
        setState(() {
        _registeredExpenses.insert(expenseIndex, expense);
        });
    }),
    ),
  );
}

  @override
  Widget build(BuildContext context) {

Widget mainContent = const Center(
  child: Text('No Expenses found. Start adding some!'),
);

if (_registeredExpenses.isNotEmpty){
  mainContent = ExpensesList(
    expenses: _registeredExpenses,
    onRemoveExpense: _removeExpense,
  );
}
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Flutter ExpenseTracker'),
        actions: [IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
    const Text('chart goes here'),
          Expanded(
            child: mainContent,
            ),
        ],
      ),
    );
  }
}