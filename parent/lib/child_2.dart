import 'package:flutter/material.dart';

//tässä tiedostossa on 2 lapsi jossa kuva


class Child2 extends StatefulWidget {
  const Child2({super.key});

  @override
  State<Child2> createState() => _Child2State();
}

class _Child2State extends State<Child2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              'Olen Child 2',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 16), // Lisää väliä tekstin ja kuvan välille
            Image.asset(
              'assets/images/minion.png', 
              width: 200, 
              height: 200, 
            ),  
            
          ],
        ),
      ),
    );
  }
}