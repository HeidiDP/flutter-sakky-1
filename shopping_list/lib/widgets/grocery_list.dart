import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
//tehdään funktio jota käytetää iconbuttonissa lisäämään uusi tuote-> siirrytään new_icon näkymään
void _addItem(){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => const NewItem(),
  ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your groceries'),
        actions: [
          IconButton(
            onPressed: _addItem, 
            icon: const Icon(Icons.add),
            
          ),
          ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length, //count joka laskee montako tuotetta on
        //nuolifunktio palauttaa listtilen
        itemBuilder: (cxt, index) => ListTile(
        //ListTile widgettiin generoidaan tuotteet dummyitem  tiedostosta
        title: Text(groceryItems[index].name),
        leading: Container(
          width: 24,
          height: 24,
          color: groceryItems[index].category.color,
        ),
        trailing: Text(
          groceryItems[index].quantity.toString(),
          ),
        ),     
      ),
    );
  }
}