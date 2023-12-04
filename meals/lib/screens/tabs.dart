import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

//TABS ON KEHYS "FRAME" JONKA SISÄLLÄ ON CATEGORIES NÄKYMÄ->meals categoriat


//k on käytäntö flutterissa const arvoja varten
const kInitialFilters = {
  
  //määritellääm kaikki falseksi ettei tule null ongelmia
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian:false,
  Filter.vegan: false,
};

//riverpod widget, niiden käyttö mahdollistaa ominaisuudet 
//statefulwidget vaihda kuten alla on eli ->consumerstafulwidget
//jos widget on stateless widget niin  silloin vaihdetaan ->consumerwidget
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
int _selectedPageIndex = 0; //tämän perusteella näytetään oikea sivu


void _selectPage(index){
  setState(() {
    _selectedPageIndex = index;
  });
}

void _setScreen(String identifier) async {
  Navigator.of(context).pop(); //sulkee drawerin ettei se ole "tiellä" kun palataan takaisin filtterivalikosta vaan menee suoraan categorioihin
  if(identifier == 'Filters'){  
    //tässä tabs jää odottamaan mitä filters palauttaa(yleinen esimerkki on datan haku tietokannsta)
   /*final result = */ await Navigator.of(context).push<Map<Filter, bool>>(
      MaterialPageRoute(
      builder:(ctx) => const FiltersScreen(), //filters.dart sivulta tuotu filtterit
      ),
      );
      //jos arvo on resultissa tallennetaan se, tai stten oletuksena kinitialfilters jos result on null
     // _selectedFilters = result ?? kInitialFilters;
  }
}

  @override
  Widget build(BuildContext context) {
    //lisätään muuttuja johon tallennetaan suodatettu aterialista käyttäjän valinnan perusteella
    //where -> käydään läpi atriat joiden tagit vastaa käyttäjän valintaa
    //where suorittaa funktion jossa on logiikka säilytetäänkö true elementti vai ei false
    //ref on osa riverpod widgettiä/ref.read ->lukee datan kerran
    
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage =  CategoriesScreen(
      //onToggleFavorite: _toggleMealFavoriteStatus, //TÄSSÄ KETJUTUKSEN YKSI OSA//KOMMENTOITU TARKOITUKSELLA
      availableMeals: availableMeals,
    ); //oletuksena kategoriat
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen( 
        meals: favoriteMeals, //'data tulee riverpodista eli favoritemeals providerista'
        //onToggleFavorite: _toggleMealFavoriteStatus  //TÄSSÄ KETJUTUS JATKUU ETTÄ SUOSIKKI LISÄYS/POISTO TOIMISI/komnentoitu tarkoitukselle
        );
      activePageTitle = 'Your favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      
    );
  }
}