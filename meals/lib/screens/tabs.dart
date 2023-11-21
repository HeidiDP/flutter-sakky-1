import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
int _selectedPageIndex = 0; //tämän perusteella näytetään oikea sivu
final List<Meal> _favoriteMeals = [];

//funktio/metodi = kaikki metodit ovat funktioita mutta vain luokan funktiot ovat metodeja
//tällä luokan metodilla lisätään suosikkeihin ateria jos se ei ole jo siellä, jos on niin se poistetaan suosikeista
void _toggleMealFavoriteStatus(Meal meal){ //FUNKTION LÄHDEPAIKKA ATERIAN LISÄYS TAI POISTO SUOSIKEISTA
//tutkitaan onko ateria listassa
final isExisting = _favoriteMeals.contains(meal);
//suoritetaan poisto jos ateria löytyy listalta tai lisätään ateria suosikki listaan
//setstate pitää olla tai muuten sivu ei päivity jos poistat suosikin
if(isExisting == true){
  setState(() {
    _favoriteMeals.remove(meal);
  });
  _showInfoMessage( '${meal.title}''Meal removed from favorites!'); // ${ruoka.ruuan nimi} saadaan tulostumaan nimi viestiin(strin intrpolaatio)
  
}else {
  setState(() {
     _favoriteMeals.add(meal);
  });
  _showInfoMessage('${meal.title}''Marked as favorite!');
}
}
void _showInfoMessage(String message){
ScaffoldMessenger.of(context).clearSnackBars();//poistetaan vanha viesti
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text(message),
  )
);
}

void _selectPage(index){
  setState(() {
    _selectedPageIndex = index;
  });
}


  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus, //TÄSSÄ KETJUTUKSEN YKSI OSA
    ); //oletuksena kategoriat
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePage = MealsScreen( 
        meals: _favoriteMeals, //TÄSSÄ OLI TYHJÄ LISTA JA SE VAIHDETTIIN SUOSIKKIATERIA LISTAKSI _FAVORITEMEALS
        onToggleFavorite: _toggleMealFavoriteStatus  //TÄSSÄ KETJUTUS JATKUU ETTÄ SUOSIKKI LISÄYS/POISTO TOIMISI
        );
      activePageTitle = 'Your favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(),
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