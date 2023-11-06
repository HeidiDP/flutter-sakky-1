import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  //luokan constructor alla. Tämä suoritetaan kun luokasta luodaan objekti jossain(eli luokkaa käytetään jossain toisessa filessa esim.)
  //constructoria tarvitaan että saadaan tuotua dataa
  const Chart({super.key, required this.expenses}); 

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      //generoidaan sankot joita käytetään pylväskaavioiden luomisessa, tässä eri kategoriat
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

//hakee kaikista suurimman sankon summan 
  double get maxTotalExpense {
    //oletuksena nolla
    double maxTotalExpense = 0;

//käydään läpi jokainen sanko(jokainen kategoria)
    for (final bucket in buckets) {
      //jos sankon summa on suurempi kuin löydetty maksimi(maxTotalExpese) vs edellinen maxTotalexpense
      if (bucket.totalExpenses > maxTotalExpense) {
        //päivitetään uusi maksimi sanko
        maxTotalExpense = bucket.totalExpenses;
      }
    }
//palautetaan maksimi sankon koko
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(  //sarake
        children: [
          Expanded(
            child: Row( // rivillä on chartbar ikoneita
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()  //täällä ifillä käydään kaikki kategoriat jotka
                  ChartBar(  //nämä on pylväitä
                  //alla on ternary operaatio
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense, //montako prosenttia yhden sankon ostokset on toisista sankoista
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            //tähän generoidaan kategorian ikonit niin monta kuin niitä on 
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
