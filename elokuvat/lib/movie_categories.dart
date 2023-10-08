import 'package:flutter/material.dart';
import 'package:elokuvat/select_category.dart';

class MovieCategories extends StatefulWidget {
  const MovieCategories({super.key});

  @override
  State<MovieCategories> createState() => _MovieCategoriesState();
}

class _MovieCategoriesState extends State<MovieCategories> {
   final List<String> categories = ['Draama', 'Kauhu', 'Komedia', 'Toiminta'];  //kategorioista tehty lista

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //materialapin  sisällä luodaan navigator joten  tarvitaan
     //ylimäääräinen Builder widget väliin, jotta sellainen context siirtyy widget puuta alas päin, jossa on se Navigator objecti
      home: Builder (builder:(context) => //jos tätä ei laita ei myöskään näkymä vaihdu nappia buttonia painamalla
      Scaffold(
        appBar: AppBar(
          title: const Text('Valitse Elokuva kategoria',
          style:TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 100, 50, 100), //appbarin taustaväri
          ),
        body: Container(
          decoration: const BoxDecoration(  //musta taustaväri
            color: Colors.black),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  
              children: [  //categoria lista tulostuu allekkain buttoneina(for käytössä, looppaa niin monta kertaa kuin kategoriota on)
                for (String category in categories)
             
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton( 
                           onPressed: (){Navigator.push( context,
                          MaterialPageRoute(
                            builder: (context) =>SelectCategory(category:category),
                            ),
                           );
                        }, //nappuloiden tyyli ja väritys
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 65, 62, 62),
                              foregroundColor: Colors.white),
                              
                           child: Text(category) 
                          ),
                        ),
                      ],
                    ),
                  
                 ],
              ),
          ),
        ),
       ),
      ),
    );
  }
}