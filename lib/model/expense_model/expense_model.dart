import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject{

  @HiveField(0)
  final String new_expense;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int iconCodePoint;

  ExpenseModel({
    required this.new_expense,
    required this.category,
    required this.date,
    required this.iconCodePoint});

  IconData get icon => IconData(iconCodePoint, fontFamily: 'MaterialIcons');

}

@HiveType(typeId: 1)
class IncomeModel extends HiveObject{
  @HiveField(0)
  final String income;

  IncomeModel({required this.income});
}