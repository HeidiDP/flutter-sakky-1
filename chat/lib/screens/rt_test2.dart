import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


User? user = FirebaseAuth.instance.currentUser;
String? uid = user!.uid;

//data rakenne

//database root
// -reservations
//  - generated ID
//    -datetime: "2024-02-20 12:47:57" (ei toimi firebase range vertailussa, laita timestamp)
//    -timestamp: 1231654687645 <-millisekunnit vuodesta 70 alkaen kun aika ilmaistaan integer muodossa(helpompi vertailla)
//    -item_id: 1(oikeasti firebase generoi tämän)
//    -user_id: "cE5Ghjiege64B"
//    -duration: 45
// -users
//    -user Id generated
//      -email:"tes@tes.tes"
//      -name: "Test User"

final databaseReference = FirebaseDatabase.instance.ref();//tällä saadaan yhteys tietokantaan(voit määrittää polun ref sulkujen sisään)

class RtTest2Screen extends StatelessWidget {
  const RtTest2Screen({super.key});

//tällä funktiolla luodaan varaus tietokantaan
void _createReservation()async {

const datetime = "2024-02-16 12:14:10";
int timestamp = DateTime.parse(datetime).millisecondsSinceEpoch;

  //data joka tallennetaan(JSON objekti)
  final reservation = {
    "user_id": uid,
    "item_id": 3, //kovakoodataan 1 ->eteenpäin
    "timestamp": timestamp
  };
  databaseReference.child('reservations').push().set(reservation); //kun on push niin ei tallenna edellisen päälle vaan tekee uuden varauksen tietokantaan
  //alla luetaan data kerran, löyty myös keino seurata dataa tarvittaessa
  DatabaseEvent event = await databaseReference.child('reservations').once();
  print('Tietokannan varaukset:${event.snapshot.value}');

}

void _createUser(){

  final user = {

    "email": "testi@testi.com",
    "name": "Testi Tapsa"
  };
   databaseReference.child('user_data/$uid').set(user);
}

void _queryMyReservations() async {
  Query query = databaseReference
  .child('reservations')//mitä dokumenttia selataan
  .orderByChild('user_id')//mitä dataa tutkitaan
  .equalTo(uid);//mikä arvo halutaan
  //jotta query toimii, tietokannan säännöissä pitää olla indeksi määriteltynä

  DatabaseEvent event = await query.once();
  print('Minun varaukset: ${event.snapshot.value}');
}

void _logout() async {
  FirebaseAuth.instance.signOut();
}

void _queryReservationsByDateRange() async {
  const startDatetime = '2024-01-10 12:08:10';
  const endDatetime = '2024-02-16 12:10:10';

  int timestampStart = DateTime.parse(startDatetime).millisecondsSinceEpoch;
  int timestampEnd = DateTime.parse(endDatetime).millisecondsSinceEpoch;

  Query query = databaseReference
  .child('reservations')
  .orderByChild('timestamp')
  .startAt(timestampStart)
  .endAt(timestampEnd); //ei ole pakko käyttää molempia, aloitusta ja lopetusta

   DatabaseEvent event = await query.once();
   print('Alku-loppu: : $timestampStart -$timestampEnd');
  print('Varaukset aikavälillä: ${event.snapshot.value}');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RealTime Test2-app'),
        actions: [
          IconButton(onPressed: (){
            _logout();
           
          }, 
          icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _createReservation, 
              child: const Text('Create reservation'),
            ),
            //toinen nappi
              ElevatedButton(
              onPressed: _createUser, 
              child: const Text('Create user'),
            ),
             ElevatedButton(
              onPressed: _queryMyReservations, 
              child: const Text('Check my reservations'),
            ),
            ElevatedButton(
              onPressed: _queryReservationsByDateRange, 
              child: const Text('Check my reservations'),
            ),
          ],
        ),
      ),
    );
  }
}