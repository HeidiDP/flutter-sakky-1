import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PesukoneKalenteri extends StatefulWidget {
  const PesukoneKalenteri({super.key});

  @override
  State<PesukoneKalenteri> createState() => _PesukoneKalenteriState();
}

class _PesukoneKalenteriState extends State<PesukoneKalenteri> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
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
        ],
      ),
    );
  }
}