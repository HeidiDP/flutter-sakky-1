import 'package:flutter/material.dart';
import 'package:favorite_places/models/place.dart';
//tämä widget näkyy screen/places.dart tiedostossa

//widget saa paremerina listan place objekteja ja palauttaa ne ListView.builder rakenteessa

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if(places.isEmpty){
      return  Center(
        //täällä ifissä on oma return, funktion suoritus loppuu kun return tapahtuu
        child: Text('No places added yet',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),       
      );
    }
    //jos dataa palauetaan tämä widget rakenne
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: FileImage(places[index].image),
          ),
        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          ),
      ),
    ); 
  }
}