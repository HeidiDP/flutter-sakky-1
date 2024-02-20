import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


User? user = FirebaseAuth.instance.currentUser;
String? uid = user!.uid;

DateTime now = DateTime.now();
String month =' ${now.month}_${now.year}';

//data rakenne

//database root
// -reservations
//  - generated ID
//    -daterime: "2024-02-20 12:47:57"
//    -item_id: 1(oikeasti firebase generoi tämän)
//    -user_id: "cE5Ghjiege64B"
//    -duration: 45
// -users
//    -user Id generated
//      -email:"tes@tes.tes"
//      -name: "Test User"

final databaseReference = FirebaseDatabase.instance.ref('reservations/$month');//tällä saadaan yhteys tietokantaan

const timestamp = '1232643375486';//tähän generoidaan tämän hetken timestamp
final timestamp2 = DateTime.now().millisecondsSinceEpoch;
final databaseReference2 = FirebaseDatabase.instance.ref('reservations/$timestamp');


class RtTestScreen extends StatelessWidget {
  const RtTestScreen({super.key});

  _userDatabase() async {
    final data = {
      "users": {
       "$uid": {
      "varaukset":[
        {
          "name": "User 1",
          "email": "user1@example.com",
      },
         {
          "name": "User 2",
          "email": "user2@example.com",
      },
         {
          "name": "User 3",
          "email": "user3@example.com",
      },
       ]
      }
    }
  };
  DatabaseEvent event = await databaseReference.once();
  //print (event.snapshot.value);

  databaseReference.set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RealTime Test-app'),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, 
          icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _userDatabase, 
          child: const Text('Use Database!'),
        ),
      ),
    );
  }
}