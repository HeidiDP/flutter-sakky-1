import 'package:flutter/material.dart';
import 'package:parent/child_a.dart';

//tässä on projektin etusivu jossa taustaväri ja teksti, tässä käytetään chlildA widgettiä jossa on napit

class Parent extends StatefulWidget{
  const Parent({super.key});

  @override
  State<Parent> createState() {
    return ParentState();
}
}
class ParentState extends State<Parent> {
//var activveScreen = 'child-1';

//tähän tarvitaan funktio

/*void switchScreen2(){       //tässä näitä tehdään kolme kappaletta kaikille lapsille 
  setState((){
activeScreen = 'child-2';
 });
}*/
  @override
  Widget build(BuildContext context) {

//tähän luokkamuuttuja childWidget = Child1();

//if(activeScreen == 'child-2') {
// childWidget = Child2();
// }

    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [    //radialagradien taustaväri musta-violetti
              Color.fromARGB(255, 89, 2, 104),
              Color.fromARGB(255, 0, 0, 0),             
            ],
            ),
          ),
              
             child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(                     //valkoinen teksti jossa lukee missä sivulla ollaan
                'Olet parent sivulla',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              ChildA(), // Käytä ChildA-widgetiä tässä, saat napit sieltä näkyviin tässä
              //tässä yllä voisi olla myös luokkamuuttuja child: ChildWidget(jotta widget voi muuttua)
            ],
          ),
        ),
      ),
    );
  }
}






// MITEN TÄHÄN SAA SEN CHILDA WIDGETIN käyttöön että tulisi ne napit????
