import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../model/expense_model/expense_model.dart';

class AddIncomeController extends GetxController {
  Rx<IconData?> selectedIcon = Rx<IconData?>(null);
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  var expenses = <ExpenseModel>[].obs;
  late Box<ExpenseModel> expenseBox;

  var income = ''.obs;
  late Box<IncomeModel> incomeBox;

  RxInt totalExpense = 0.obs;
  RxInt totalBalance = 0.obs;

  void selectIcon(IconData icon) {
    selectedIcon.value = icon;
  }

  void setDateTime(DateTime date) {
    selectedDate.value = date;
  }

  @override
  void onInit() {
    super.onInit();
    expenseBox = Hive.box<ExpenseModel>('expense');
    incomeBox = Hive.box<IncomeModel>('income');
    loadExpenses();
    loadIncome();
    calculateExpenses();
    calculateBalance();
  }

  void loadExpenses() {
    expenses.value = expenseBox.values.toList().reversed.toList();
    calculateExpenses();
    calculateBalance();
  }

  void loadIncome() {
    income.value = incomeBox.isNotEmpty ? incomeBox.values.last.income : '0';
    calculateBalance();
  }

  void addIncome(String incomeVal) {
    final incomeModel = IncomeModel(income: incomeVal);
    incomeBox.add(incomeModel);
    loadIncome();
  }

  void addExpense(String expense, String category, String date, int icon) {
    final expenseModel = ExpenseModel(
      new_expense: expense,
      category: category,
      date: date,
      iconCodePoint: icon,
    );
    final key = expenseBox.add(expenseModel); // Add to Hive
    // Insert at the beginning of the expenses list
    expenses.insert(0, expenseModel);
    calculateExpenses();
    calculateBalance();
  }

  void deleteExpense(int index) {
    if (index >= 0 && index < expenses.length) {
      expenseBox.deleteAt(index); // Delete from Hive using the same index
      expenses.removeAt(index);   // Remove from the list
      calculateExpenses();
      calculateBalance();
    }
  }

  void editExpense(int index, String newExpense, String newCategory) {
    if (index >= 0 && index < expenses.length) {
      final oldExpense = expenseBox.getAt(index);
      if (oldExpense != null) {
        final updatedExpense = ExpenseModel(
          new_expense: newExpense,
          category: newCategory,
          date: oldExpense.date,
          iconCodePoint: oldExpense.iconCodePoint,
        );
        expenseBox.putAt(index, updatedExpense); // Update in Hive
        expenses[index] = updatedExpense;        // Update in the list
        calculateExpenses();
        calculateBalance();
      }
    }
  }

  void calculateExpenses() {
    int total = 0;
    for (var e in expenseBox.values) {
      total += int.tryParse(e.new_expense) ?? 0;
    }
    totalExpense.value = total;
  }

  void calculateBalance() {
    int incomeVal = int.tryParse(income.value) ?? 0;
    totalBalance.value = incomeVal - totalExpense.value;
  }

  void clearData() {
    expenseBox.clear();
    incomeBox.clear();
    expenses.clear();
    income.value = '0';
    totalExpense.value = 0;
    totalBalance.value = 0;
  }

  Map<String, double> calculateCategoryTotals() {
    final Map<String, double> totals = {};

    for (var expense in expenses) {
      final amount = double.tryParse(expense.new_expense) ?? 0.0;
      totals.update(expense.category, (value) => value + amount, ifAbsent: () => amount);
    }

    return totals;
  }
}
