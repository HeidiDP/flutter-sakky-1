import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

User? user = FirebaseAuth.instance.currentUser;//haetaan kirjautuneen käyttäjän uid
String? uid = user!.uid;//tälle sivulle pääsee vain kirjautunut käyttäjä

final databaseReference = FirebaseDatabase.instance.ref();

class RtStreamScreen extends StatelessWidget {
  const RtStreamScreen({super.key});

  void _createReservation() async {
    const datetime = "2024-02-16 12:14:10";
int timestamp = DateTime.parse(datetime).millisecondsSinceEpoch;

  //data joka tallennetaan(JSON objekti)
  final reservation = {
    "user_id": uid,
    "item_id": 15, //kovakoodataan 1 ->eteenpäin
    "timestamp": timestamp
  };
  databaseReference.child('reservations').push().set(reservation); //kun on push niin ei tallenna edellisen päälle vaan tekee uuden varauksen tietokantaan
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Streambuilder'),
      ),
      body: StreamBuilder(
        stream: databaseReference
        .child('reservations')
        .orderByChild('user_id')//tässä pitää olla käyttäjän id jos sillä haetaan dataa
        .equalTo(uid)//haetaan vain kirjautuneen käyttäjän varaukset
        .onValue, 
      builder: (context, snapshot){
        //virheiden tarkistus
        //ladataan tietoa näytetään spinner
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
      // saadaan virhe
        if(snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'),); //oikeasti tätä oikeaa virhettä ei näytetä käyttäjälle
        }
        //ei ole dataa
        if(!snapshot.hasData || snapshot.data!.snapshot.value == null){
          return const Center(child: Text('No reservation found'),);
        }
        //tänne päästään kun saadaan dataa
        //otetaan data talteen muuttujaan , voi olla myös List<Model>
        //Eli Json data => List<JokinLuokka>
        
        Map<dynamic, dynamic>? data = 
        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;  

        var reservations = <Map<dynamic, dynamic>>[];

        //JSon muotoon objekti
          data.forEach((key, value) {
            reservations.add(value);
          });

        //järjestetään data timestampin mukaisesti 
        reservations.sort((a, b) => a['item_id'].compareTo(b['item_id']));

        //generoidaan widget puu (UI)
        return Column(
          children: [
          Expanded(
           child: ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              //yksi varaus
              final reservation = reservations[index];
              return ListTile(
                title: Text('Timestamp: ${reservation['timestamp']}' ),
                subtitle: Text('Item ID: ${reservation['item_id']}' ),
                trailing: Text('User ID: ${reservation['user_id']}' ),
              );
            }
              ),
             ),
           ElevatedButton(onPressed: _createReservation, child: const Text('Create Reservztion'),
           ),
          ],
        );   
        },
    ),
    );
  }
}