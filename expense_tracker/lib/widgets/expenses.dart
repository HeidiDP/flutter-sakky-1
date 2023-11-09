import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart'; 
import 'package:expense_tracker/widgets/chart/chart.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

//tässä on lista tuotteista
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
  useSafeArea: true, //ei käytetä käyttöliittymän tilaa,kamera jne näytön yläosassa
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
//poiston peruutus //TÄÄLLÄ ON KÄYTÖSSÄ SNACKBAR ILMOITUS
ScaffoldMessenger.of(context).clearSnackBars();
ScaffoldMessenger.of(context).showSnackBar(
  //snackbar on tapa ilmoittaa käyttjälle viestejä
  //tässsä annetaan ilmoitus ostoksen poistosta ja nappi jolla ostos voidaan palauttaa
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
    //näytön leveyttä ja korkeuttavoidaan katsella tällä luokalla/se on osa materialappia
    //print(MediaQuery.of(context).size.width);
   // print(MediaQuery.of(context).size.height);
   final width = MediaQuery.of(context).size.width;

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
        centerTitle: true,// iOS oletus asetus
        title:const Text('Flutter ExpenseTracker'),
        actions: [IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))],
      ),
      //tutkitaan laitteen leveys ja sen perusteella luodaan column tai row ternaryoperaation avulla eli alla ? ja row :
      body: width < 600 ? 
      Column(
        //TRUE ->päällekkäin
        children: [
    //const Text('chart goes here'),
    Chart(expenses: _registeredExpenses), //tässä on luokan parametri eli tähän charttiin tulee lista tuotteista
          Expanded(
            child: mainContent,
            ),
        ],      
      )
       :  Row(
       // FALSE ->vierekkäin
        children: [
    //const Text('chart goes here'),
          Expanded(
             child: Chart(expenses: _registeredExpenses),
             ), 
          Expanded(
            child: mainContent,
            ),
        ],      
      ),
    );
  }
}

//jsize constraint ja preferences widgeteillä ,
//nämä määrittävät widgetin koon, contstrai tarkoittaa vanhemman rajoituksia lapseille
//preferences tarkoittaa widgetin omaa käyttäytymistä
//jokaisella widgetillä on sen omat preferences(kuinka haluaa asettua) ja sen constraints sen lapsille(rajoitukset näille)
//jos vanhempi widget esim column ja sillä lapsi esim litview
//column ei rajoita sen lapsien korkeutta ja listview prefrences on ääretön korkeus
// Lopputuloksena on ääretön kokrkeus listview widgetille joka on mahdoton toteuttaa