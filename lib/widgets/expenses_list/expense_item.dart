import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expenses_application/models/expense.dart';
import 'package:expenses_application/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
        child: Column(
          children: [
            Text(expense.title,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 4.0,),
            Row(
              children: [
                Text('${expense.amount.toStringAsFixed(2)} JOD'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8.0,),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
