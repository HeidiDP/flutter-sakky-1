//tässä on täytteiden luokka jota hyödynnetään sitten muissa tiedostoissa muuttujiin laitetu arvot 

class Ingredient {

  const Ingredient(this.name, this.gramsPerPortion, this.caloriesPer100g);

  final String name;
  final double gramsPerPortion;
  final double caloriesPer100g;
}