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
 
  //muuttuja jossa on tietokannasta haetut tavarat
  late Future<List<GroceryItem>> _loadedItems;
  //late, luvataan kääntäjälle että ladataan muuttujaan data een kuin sitä käytetäänn build funktiossa
  //widget elinkaaressa initstate()->build()

  @override
  //haetaan tuotteet tietokannasta, tapahtuu tässä initstatessa
  initState(){
    super.initState();
    _loadedItems = _loadItems();
  }

  //metodi on async, se palautaa datan futre muodossa
  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https( //meidän database linkki alla
      'flutter-test-2-6aa0c-default-rtdb.europe-west1.firebasedatabase.app',
      'shoppin-list.json');

      //get post delete jne heittää tällääisen virheen joissain tilanteissa, 
      //meidän pitää hallita tilanne: try{}catch(){}
      //throw Exeption('An error occured!');
      //tämä trycatch pitäisi lisätä joka paikkaan missä käytettään http metodeja


final response = await http.get(url);
if(response.statusCode >= 400){
 //setState(() {
  // _error = 'Failed to fetch data. Please try again later!';
// }); 
//heitetään virhe joka käsitellään futurebuild snapshotissa
throw Exception('Failed to fetch items!');
}

var testForNull = json.decode(response.body);
if(testForNull == null){
  
  return [];
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

return loadedItems;

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
      body: FutureBuilder(future: _loadedItems, builder: (context, snapshot){
        //täällä snapshotin tilanteen perusteella generoidaan eri widget rakenne
        if(snapshot.connectionState == ConnectionState.waiting){
          //snapshot odottaa dataa, näytetään spinner
          return const Center(
            child:  CircularProgressIndicator(),
          );
        }
      //virhetilanne
        if(snapshot.hasError){
          return Center(
          child: Text(snapshot.error.toString()),
          );
        }
      //tyhjä lista, data on haettu ja siinä on tyhjä lista
        if (snapshot.data!.isEmpty){
            const Center(
        child: Text('No items added yet.'),
         );
        }

        // oletuksena lopuksi , näytetään käyttäjän tuotteet
        return ListView.builder(
        itemCount: snapshot.data!.length, //count joka laskee montako tuotetta on
        //nuolifunktio palauttaa listtilen
        itemBuilder: (cxt, index) => Dismissible(
          onDismissed: (direction){
            _removeItem(snapshot.data![index]);
          },
        key: ValueKey(snapshot.data![index].id),
        child: ListTile(
        //ListTile widgettiin generoidaan tuotteet dummyitem  tiedostosta
        title: Text(snapshot.data![index].name),
        leading: Container(
          width: 24,
          height: 24,
          color: snapshot.data![index].category.color,
        ),
        trailing: Text(
          snapshot.data![index].quantity.toString(),
          ),
         ),  
        ),   
      );
      }),
          //tässä suoritetaan loaditems metodi joka palauttaa futuurin
          //nyt tieto haetaan tietokannasta, joka kerta kun build suoritetaan , tämä aiheuttaa turhaa tietokantakutsua
        //FutureBuilder(future: _loadItems(), builder: (context, snapshot){}),
    );
  }
}