enum Filters{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
  FiltersNotifier(): super
  (
    {
      //oletusdata stateen, kaikki oletuksena false
      Filter.glutenFree : false,
      Filter.lactoseFree : false,
      Filter.vegetarian : false,
      Filter.vegan : false,
    }
  );
}
 void setFilter( Filter filter, bool isActive){
    //state on nyt rakenteeltaan Map<Filter, bool>

    //täytyy luoda uusi map ja korvata kokonaan vanha map
    state = {
      ...state, //puretaan vanha map
      filter: isActive, //ylikirjoitetaan uusi data

    };
   }

    void setFilters(Map<Filter, bool> chosenFilters){
      state = chosenFilters;
    }
  
}
//FilterNotifier() => luokan nimen perässä() => luodaan objekti luokasta 
final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier());
  
//provideri joka palauttaa dataa muiden provaderien datan perusteella
  final filteredMealsProvider = Provider((ref) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
      //jos käyttäjä on valinnut glutenfree &&(ja) ateria ei ole ! gluten free-> poistetaan ateria
      //tutkitaan käyttäjän valinta ja mikä on aterian data
      return meals.where((meal){
      if(activeFilters[Filter.glutenFree]! && meal.isGlutenFree ==false){
        return false;
      }
      if(activeFilters [Filter.lactoseFree]! && meal.isLactoseFree == false){
        return false;
      }
      if(activeFilters [Filter.vegetarian]! && meal.isVegetarian == false){
        return false;
      }
      if(activeFilters [Filter.vegan]! && meal.isVegan == false){
        return false;
      }
//kun kaikki suodattimet ollaan käyty läpi, lopuksi palautetaan ateria jos tänne on päästy ja ko filtteröity ateria on olemassa
      return true;
    }).toList();
  });