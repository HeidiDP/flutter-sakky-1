import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  @override
  initState(){
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https( //meidän database linkki alla
      'flutter-test-2-6aa0c-default-rtdb.europe-west1.firebasedatabase.app',
      'shoppin-list.json');

final response = await http.get(url);
final Map<String, Map<String, dynamic>> listData = 
json.decode(response.body);
//käydään listan key/value pareja läpi(json pareja)
for(final item in listData.entries){
//täällä saadaan map, jossa on groceryitem tarvittava data
GroceryItem(id: id, name: name, quantity: quantity, category: category)
}

}

//tehdään funktio jota käytetää iconbuttonissa lisäämään uusi tuote-> siirrytään new_icon näkymään
void _addItem() async {
 //final newItem = 
 await Navigator.of(context).push<GroceryItem>(
    MaterialPageRoute(
      builder: (ctx) => const NewItem(),
  ),
  );

  _loadItems();


  // if(newItem  == null){
  //   //jos ei ole uutta dataa niin lopetetaan funktion suoritus
  //   return;
  // }

  // setState(() {
  //     _groceryItems.add(newItem);
  // });

}

void _removeItem(GroceryItem item){
  setState(() {
     _groceryItems.remove(item);
  });
}

  @override
  Widget build(BuildContext context) {

Widget content = const Center(
  child: Text('No items added yet.'),
);

if(_groceryItems.isNotEmpty){
ListView.builder(
        itemCount: _groceryItems.length, //count joka laskee montako tuotetta on
        //nuolifunktio palauttaa listtilen
        itemBuilder: (cxt, index) => Dismissible(
          onDismissed: (direction){
            _removeItem(_groceryItems[index]);
          },
        key: ValueKey(_groceryItems[index].id),
        child: ListTile(
        //ListTile widgettiin generoidaan tuotteet dummyitem  tiedostosta
        title: Text(_groceryItems[index].name),
        leading: Container(
          width: 24,
          height: 24,
          color: _groceryItems[index].category.color,
        ),
        trailing: Text(
          _groceryItems[index].quantity.toString(),
          ),
         ),  
        ),   
      );
}

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
      body: content,
    );
  }
}