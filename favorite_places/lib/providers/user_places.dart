import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/place.dart';
import 'dart:io';
//riverpod tarvitsee providerin(esim mainissa paketoidaan sillä, lisäksi Notifierin(tee provider kansio ja sinne luokka) 
//sekä Consumerwidgetin pää luokkiin esim screenwidgettiin)

class UserPlacesNotifier extends StateNotifier<List<Place>>{
  //const [] on oletud data joka määritellään, siinä voisi olla oletuksen amuutakin¨
  //huomoi että käytetään const, riverpod data on immutable joka tarkoittaa että dataa/objektia ei muokata vaan luodaan aina uusi objekti kuten lista

  UserPlacesNotifier() : super(const []);

//muokataan state, korvataan vanha lista uudella listalla
  void addPlace(String title, File image){
    final newPlace = Place(title: title, image: image);
    //tallennetaan state propertiin uusi lista jossa on uusi place ja vanhat place
    state =[newPlace, ...state];
     
  }
}
//tämän providerin kautta käsitellään dataa
final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier());