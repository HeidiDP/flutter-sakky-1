import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_place.dart';


//riverpod tarvitsee providerin(esim mainissa paketoidaan sillä, lisäksi Notifierin(tee provider kansio ja sinne luokka) 
//sekä Consumerwidgetin pää luokkiin esim screenwidgettiin)

class PlacesScreen extends ConsumerWidget{
  const PlacesScreen({super.key});

@override
Widget build(BuildContext context, WidgetRef ref){
  final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ÿour places'),
        actions: [
          IconButton(
            //voisi luoda uuden metodin, joka avaa lisäys sivun
            //_addPLace();
            
            onPressed: (){
              Navigator.of(context).push(
              
              MaterialPageRoute(builder: (context) => const AddPlaceScreen(),
              ),
            );
            }, 
            icon: const Icon(Icons.add),
            ),
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(places: userPlaces),
      ),
    );
    }
}

