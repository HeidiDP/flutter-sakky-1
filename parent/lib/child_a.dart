import 'package:flutter/material.dart';
import 'package:parent/child_1.dart';
import 'package:parent/child_2.dart';
import 'package:parent/child_3.dart';


//tässä tiedostossa on napit ja tekstit napeissa, lisäksi toiminnot kun nappia painaa niin siirrytään valitun childin sivulle


class ChildA extends StatefulWidget {
  const ChildA({super.key});

  @override
  State<ChildA> createState() {
    return ChildAState();
  }
}

class ChildAState extends State<ChildA> {
  @override
  Widget build(BuildContext context) {
     return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        //kolme nappulaa vierekkäin 
        children: [

// 1 lapsi nappi

          ElevatedButton(
            onPressed: () {        //onPressed: (widget.switch1,)-> vaihtoehtoinen  tapa
             Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Child1(),
                    ),
                  );
            },
             style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 212, 0, 255), // nappien taustaväriksi valittu violetti
                ),
            child: const Text('Child 1'),

//2 lapsi nappi  
          ),
          const SizedBox(width: 16), // Lisää väliä nappien välille
          ElevatedButton(
            onPressed: () {         //onPressed: (widget.switch3,)-> vaihtoehtoinen  tapa
              Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Child2(),
                    ),
                  );
            },
            style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 212, 0, 255), 
                ),
            child: const Text('Child 2'),

//3 lapsi nappi 
          ),
          const SizedBox(width: 16), // Lisää väliä nappien välille
          ElevatedButton(
            onPressed: () {        //onPressed: (widget.switch2,)-> vaihtoehtoinen  tapa
              Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Child3(),
                    ),
                  );
            },
            style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 212, 0, 255), 
                ),
            child: const Text('Child 3'),
          ),
        ],
      ),
    );
  }
}