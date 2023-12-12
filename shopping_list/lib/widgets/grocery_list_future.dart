import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopping_list/data/categories.dart';

class GroceryListFuture extends StatefulWidget {
  const GroceryListFuture({super.key});

  @override
  State<GroceryListFuture> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryListFuture> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error = null;

  @override
  //haetaan tuotteet tietokannasta, tapahtuu tässä initstatessa
  initState(){
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https( //meidän database linkki alla
      'flutter-test-2-6aa0c-default-rtdb.europe-west1.firebasedatabase.app',
      'shoppin-list.json');

      //get post delete jne heittää tällääisen virheen joissain tilanteissa, 
      //meidän pitää hallita tilanne: try{}catch(){}
      //throw Exeption('An error occured!');
      //tämä trycatch pitäisi lisätä joka paikkaan missä käytettään http metodeja

try{
final response = await http.get(url);
if(response.statusCode >= 400){
  _error = 'Failed to fetch data. Please try again later!';
}

if(response.body == 'null'){
  setState(() {
    _isLoading = false;
  });
  return;
}

final Map<String, dynamic> listData = json.decode(response.body);
final List<GroceryItem> loadedItems = []; //uusi väliaikainen lista

//käydään listan key/value pareja läpi(json pareja)
for(final item in listData.entries){
  final category = categories.entries.firstWhere((element)=> 
  element.value.title == item.value['category']).value;

  
//täällä saadaan map, jossa on groceryitem tarvittava data
loadedItems.add(GroceryItem(
  id: item.key, 
  name: item.value['name'], 
  quantity: item.value['quantity'], 
  category: category,
    ),
  );
}
setState(() {
  _groceryItems = loadedItems;
  _isLoading =false;
});
}catch(error){
  setState(() {
    _error = 'Something went wrong! $error';
    });
  }
}

//tehdään funktio jota käytetää iconbuttonissa lisäämään uusi tuote-> siirrytään new_icon näkymään
void _addItem() async {
 final newItem = await Navigator.of(context).push<GroceryItem>(
    MaterialPageRoute(
      builder: (ctx) => const NewItem(),
    ),
  );



   if(newItem  == null){
     //jos ei ole uutta dataa niin lopetetaan funktion suoritus
    return;
   }

  setState(() {
      _groceryItems.add(newItem);
  });

}

void _removeItem(GroceryItem item) async {
  final index = _groceryItems.indexOf(item);

    setState(() {
     _groceryItems.remove(item);
  });

  final url = Uri.https(
    'flutter-test-2-6aa0c-default-rtdb.europe-west1.firebasedatabase.app',
    'shopping-list/${item.id}.json');
    
//TODO LISÄÄ TRY CATCH
   final response = await http.delete(url);

if(response.statusCode >= 400){
  setState(() {
     _groceryItems.insert(index,item);
     //TODO: Näytetään virheilmoitus (esim snackbar) tai throw Exeption('An error occured!');
   });
  }
}

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
    child: Text('No items added yet.'),
);

//jos ladataan tietokannasta dataa
if(_isLoading){
  content = const Center(
    child: CircularProgressIndicator(),
    );
}

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

if(_error != null){
   Center(
    child: Text(_error!),
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