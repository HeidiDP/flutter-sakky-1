import 'package:flutter/material.dart';

//tässä tiedostossa on 1 lapsi jossa kuva

class Child1 extends StatefulWidget {
  const Child1({super.key});  //const Child1(this.switch1,this.switch2, this.switch3{super.key});  ->vaihtoehtoinen tapa tehdä kommentoituna

  //void Function()switch1;
  //void Function()switch2;
  //void Function()switch3;


  @override
  State<Child1> createState() { 
    return _Child1State();
    }
}

class _Child1State extends State<Child1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              'Olen Child 1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 16), // Lisää väliä tekstin ja kuvan välille
            Image.asset(
              'assets/images/alien.png', 
              width: 200, 
              height: 200, 
            ),  
          ],
          
        ),
      ),
    );
  }
}