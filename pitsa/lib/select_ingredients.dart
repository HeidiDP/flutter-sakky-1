import 'package:flutter/material.dart';
import 'package:pitsa/models/ingredient.dart';
import 'package:pitsa/data/ingredients.dart'; //tuodaan datan alta täytteet

//luodaan widget johon tulee pitsan täyteaineet ja valinta buttonit ja +/- buttonit
//aloitetaan return column(placeholder tilalle)


class SelectIngredients extends StatelessWidget {
  const SelectIngredients(this.selectedIngredients,{super.key, required this.onAddIngredient});

  final void Function(Ingredient) onAddIngredient;
  final List<Map<Ingredient, int>> selectedIngredients;

  @override
  Widget build(BuildContext context) {
    return Column( 
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('kuva tähän'),
          const Text('teksti tähän'),
          //tähän buttonit
          ...ingredients.map((item){        //spread operaatio, puretaan lista widgettejä yksitellen
           
           final mapOfOneSelectedIngredient = selectedIngredients.firstWhere(  //etsitään mapista täytteitä,käydään vuorotellen jokainen läpi ja montako sitä on
            (onMap) => onMap.containsKey(item), //item on täyte esim tomaatti, kasvisjauhis
            orElse: () =>{},
           );
           final numberOfPortions = mapOfOneSelectedIngredient[item]; //ottaa talteen montako annosta täytettä on

            return Row(
              children: [
                TextButton(
                  onPressed: (){
                    onAddIngredient(item);
                  }, 
                  child: Text('${item.name} = $numberOfPortions'),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.remove_circle, color: Colors.red,
                    ),
                    ),
                    IconButton(
                      onPressed: (){
                        onAddIngredient(item);
                      },
                      icon: const Icon(Icons.add_circle,
                      color: Colors.green,
                      ),
                      ),
              ],
            );
          },
          ),
        ],
      );
    
  }
}