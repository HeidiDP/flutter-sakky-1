
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:meals_new/screens/categories.dart';


const kinitiaFilters = {

Filter.glutenFree: false;
Filter.lactoseFree: false;
Filter.vegetarian: false;
Filter.vegan: false;
};

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});

  @override 
  ConsumerState<TabsScreen> createState() => _TabsScreenState();

}

class _TabsScreenState extends ConsumerState<TabsScreen>{
  int _selectedPageIndex = 0;

  void selectPage(index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == 'Filters') {
     await  Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
           ),
      );
    }

}
@override
Widget build(BuildContext context){

  final availableMeals = ref.watch(filteredMealsProvider);

Widget activePage =  CategoriesScreen(

  availableMeals:availableMeals,

);
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