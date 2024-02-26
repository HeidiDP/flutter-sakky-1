import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PesukoneKalenteri extends StatefulWidget {
  const PesukoneKalenteri({super.key});

  @override
  State<PesukoneKalenteri> createState() => _PesukoneKalenteriState();
}

class ReservedTime {
  final String time;
  final bool isBooked;

  ReservedTime({required this.time, this.isBooked = false});
}

class _PesukoneKalenteriState extends State<PesukoneKalenteri> {
  DateTime today = DateTime.now();
  List<ReservedTime> varattavatAjat = []; // Simuloitu varattavien aikojen lista
 String selectedTime = ""; // Valittu aika

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
       // Simuloidaan tässä esimerkkinä tunnit 8-20 ja merkitään joitakin niistä varatuiksi.
      varattavatAjat = List.generate(
        13,
        (index) => ReservedTime(
          time: (index + 8).toString() + ":00", // "9:00"
          //isBooked: index % 3 == 0, // Simuloi, että joka kolmas aika on varattu
        ),
      );
    });
  }
void _onTimeSelected(String time) {
    setState(() {
      selectedTime = time;
    });
    // Tässä voit toteuttaa varauksen tallentamisen tai muut toiminnot.
    // Esimerkiksi voit avata dialogin vahvistaaksesi varauksen.
    _showConfirmationDialog();
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Vahvista varaus'),
          content: Text('Haluatko varata pesukoneen klo $selectedTime päivälle ${today.toLocal()}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Sulje dialogi
              },
              child: const Text('Peruuta'),
            ),
            TextButton(
              onPressed: () {
                // Tässä voit toteuttaa varauksen tallentamisen tai muut toiminnot.
                // Esimerkiksi voit päivittää tietokantaa tai näyttää vahvistusviestin.
                Navigator.of(context).pop(); // Sulje dialogi
                _showSuccessDialog();
              },
              child: const Text('Varaa'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Varaus onnistui'),
          content: Text('Pesukone on varattu klo $selectedTime päivälle ${today.toLocal()}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Sulje dialogi
                 _showSuccessSnackBar();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _showSuccessSnackBar() {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Varaus onnistui!'),
      duration: Duration(seconds: 3),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Pesukoneen varaus'),
      ),
      body: Column(
        children: [
          TableCalendar(
            //locale: "en_US",
            rowHeight: 43,
            headerStyle: const  HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030,3, 14),
            onDaySelected: _onDaySelected,
            
          ),
           Text('Valittu päivä:  ${today.toLocal()} '),
          // Tähän voit lisätä lisää käyttöliittymäkomponentteja, kuten varattavat ajat.
          const SizedBox(height: 16),
          const Text('Varattavat ajat:'),
          Expanded(
            child: ListView.builder(
              itemCount: varattavatAjat.length,
              itemBuilder: (context, index) {
                final reservedTime = varattavatAjat[index];
                return ListTile(
                  title: Text(reservedTime.time),
                  onTap: () {
                    if (!reservedTime.isBooked) {
                      _onTimeSelected(reservedTime.time);
                    }
                  },
                  tileColor: reservedTime.isBooked ? Colors.red : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}