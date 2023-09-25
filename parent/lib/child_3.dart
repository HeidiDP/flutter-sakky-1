import 'package:flutter/material.dart';

//tässä tiedostossa on 3 lapsi jossa kuva


class Child3 extends StatefulWidget {
  const Child3({super.key});

  @override
  State<Child3> createState() => _Child3State();
}

class _Child3State extends State<Child3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              'Olen Child 3',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 16), // Lisää väliä tekstin ja kuvan välille
            Image.asset(
              'assets/images/pumpkin.png', 
              width: 200, 
              height: 200, 
            ),  
            
          ],
        ),
      ),
    );
  }
}