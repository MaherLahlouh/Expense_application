import 'package:expenses_application/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenseList;
  final void Function(Expense expense)onRemoveExpense;

  const ExpenseList({
    required this.expenseList,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (ctx,index)=>Dismissible(
            key: ValueKey(expenseList[index]),
            onDismissed:(direction){
              onRemoveExpense(expenseList[index]);
            } ,
            child: ExpenseItem(expenseList[index]),
        ),
    );
  }
}
