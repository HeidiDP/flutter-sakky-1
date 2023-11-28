import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

//geneerinen voi sisälttää mitä tahansa dataa eli 
//pitää määrittää mitä dataa tulee pitämään sisällään <> sisälle

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  //1. data
  FavoriteMealsNotifier() : super([]); //oletuksena tyhjä lista

  //2. metodit jotka muokkaa dataa(riverpodissa data täytyy muokata immutable tavalla)
  //immutable luodaan kokonaan uusi objekti heappiin ja korvataan vanha objekti uudella(ei voi  muokata)
  //ero mutableen-> tässä muokataan objektia heapissa
  bool toggleMealFavoriteStatus(Meal meal){
    //tarkistetaan onko ateria olemassa suosikki listalla
    // contains metodi ei muokkaa listaa
    final mealIsFavorite = state.contains(meal);

  //meal löytyy eli poistetaan suosikki -POISTO-
    if(mealIsFavorite == true){
      //kopioidaan ateriat vanhasta listasta "state" uuteen listaan [], mutta poistetaan "meal" uudesta listasta
      //where on myös immutable eli se tekee uuden kopion
      //kopioidaan kaikki ateriat joiden id ei ole se id joka halutaan poistaa
      state = state.where((m) => m.id != meal.id).toList();
      return false; //poistettu
    }else{
      //...spread operaatio luo kopion lementeistä ja laitetaan ne uuden listan [] sisälle
      state = [...state, meal]; //lopuksi uusi elementti , jälkeen
      return true; //lisätty
    }

    //tässä on immutable datan muokkaus eli [] luo uuden listan ja laitetaan uusi lista vanhan tilalle
    //state = [];

    //esimerkkinä myös mutable keino eli  mukataa olemassa olevaa objektia state.add(meal)
  }

}
//dynaaminen data, statenotifierprovider
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifier();
  },
);