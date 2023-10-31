import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

//listan yksi item eli yksi tuote card

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //contextilla voidaan hakea vanhempien objekteja
            //Theme.of(contex) haetaan main sivulta
            Text(expense.title, 
            style: Theme.of(context)
            .textTheme.
            titleLarge!
            .copyWith(letterSpacing: 2 )
            ), 
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
              Text(
                  '${expense.amount.toStringAsFixed(2)}€'), //tostringasfixed korjaa desimaalit niin että niitä on vain 2
              const Spacer(),
              Row(children: [
                Icon(categoryIcons[expense.category]),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  expense.formattedDate,
                ),
              ])
            ]),
          ],
        ),
      ),
    );
  }
}
