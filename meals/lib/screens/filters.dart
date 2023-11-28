import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
//julkinen luokka
class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key, required this.currentFilters});
  
//alla muuttuja jossa valitut filtteri
  final Map <Filter, bool> currentFilters;  //kun tätä muuttujaa halutaa käyttää priva luokassa niin kts alla metodi

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}
//privaatti luokka
class _FiltersScreenState extends State<FiltersScreen>{

  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  //widget käyettävissä vain jonkin metodin sisällä
  //kun halutaan tuoda julkisesta luokasta muuttuja currentfilter niin tarvitaan alla oleva metodi että voidaan käyttää sitä privaluokassa
@override
void initState(){
  super.initState();
_glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
_lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
_vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
_veganFilterSet = widget.currentFilters[Filter.vegan]!;
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      /*drawer: MainDrawer(onSelectScreen: (identifier){
        Navigator.of(context).pop(); //suljetaan drawer
        if(identifier == 'Meals'){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const TabsScreen(),
            )
          );
        }
      }),*/
      body: WillPopScope(
        //kun funktio on async, sen palautusarvo paketoidaan futuuriin
        onWillPop: () async {
          //Avain:Arvo
          //enum käyttö helpottaa datan lukua kun kerrotaan mitä siiä on ja sen arvo
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false; //tämä määrittää suoritetaanko pop vai ei, ja koska suoritamma pop itse ja datan sen mukana ei tarvi pop uudelleen
        },
        child: Column(
          children: [
            //GLUTEENITON
          SwitchListTile(
            value: _glutenFreeFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });           
            },
            title: Text('Gluten-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
              ),
              ),
              subtitle: Text('Only include gluten-free meals', 
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            //LAKTOOSITON 
            SwitchListTile(
            value: _lactoseFreeFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });                       
            },
            title: Text('Lactose-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
              ),
              ),
              subtitle: Text('Only include lactose-free meals', 
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //VEGETARIAN
            SwitchListTile(
            value: _vegetarianFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _vegetarianFilterSet = isChecked;
              });                       
            },
            title: Text('Vegetarian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
              ),
              ),
              subtitle: Text('Only include vegetarian meals', 
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //VEGAN
            SwitchListTile(
            value: _veganFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _veganFilterSet = isChecked;
              });                       
            },
            title: Text('Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
              ),
              ),
              subtitle: Text('Only include vegan meals', 
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,           
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
        ]),
      ),
    );
  }
}