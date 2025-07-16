import 'package:expense_tracker_app/consts/format_date.dart';
import 'package:flutter/material.dart';

import '../../../model/expense_model/expense_model.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 70,
        alignment: Alignment.center,
        child: ListTile(
          leading: CircleAvatar(child: Icon(expense.icon),),
          title: Text(expense.category),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Rs. ${expense.new_expense}'),
              Text(formatDate(expense.date))
            ],
          ),
        ),
      ),
    );
  }
}
