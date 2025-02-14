import 'package:flutter/material.dart';
import 'expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
});

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction){
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index])),
    );
  }
}