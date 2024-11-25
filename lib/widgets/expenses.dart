import 'package:expenses_application/widgets/user_adding_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_application/widgets/expenses_list/expense_list.dart';
import 'package:expenses_application/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Venom: The Last Dance',
      amount: 20.0,
      date: DateTime.now(),
      category: Category.cinema,
    ),
    Expense(
      title: 'Lunch with Friends',
      amount: 35.0,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  /// Opens the bottom sheet to add a new expense.
  void _addExpensesOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return UserAddingExpense(
          onAddExpense: _addExpenses,
        );
      },
    );
  }

  /// Adds a new expense to the list.
  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  /// Removes an expense from the list.
  void _removeExpense(Expense expense) {
    final expenseIndex= _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 3),
            content: const Text('Expense removed'),
            action: SnackBarAction(
                label: 'Undo',
                onPressed: (){
                  setState(() {
                    _registeredExpenses.insert(expenseIndex, expense);
                  });
                }
            ),
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    final isExpenseListEmpty = _registeredExpenses.isEmpty;
    Widget mainContent=Center(
      child: Text(
        'No expenses found',
        style: TextStyle(fontSize: 18.0, color: Colors.grey),
      ),
    );
      if (_registeredExpenses.isNotEmpty) {
        mainContent=ExpenseList(
            expenseList: _registeredExpenses,
            onRemoveExpense: _removeExpense,
        );
      }  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses App'),
        actions: [
          IconButton(
            onPressed: _addExpensesOverlay,
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Here is the chart',
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: isExpenseListEmpty
                ? const Center(
              child: Text(
                'No expenses added yet!',
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
            )
                :mainContent
            ),
        ],
      ),
    );
  }
}
