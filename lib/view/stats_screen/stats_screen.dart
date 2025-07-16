import 'package:expense_tracker_app/consts/text_lato.dart';
import 'package:expense_tracker_app/view/stats_screen/pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/color_gradient.dart';
import '../../view_model/controller/income_controller/income_controller.dart';

class StatsScreen extends StatelessWidget {
  StatsScreen({super.key});

  final controller = Get.put(AddIncomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Expenses Overview'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: ColorGradient.colorGradient(context)
          ),
        ),
      ),
      body: Obx(() {
        final categoryTotals = controller.calculateCategoryTotals();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextLato(text: 'My Expenses', fontSize: 24,),
              SizedBox(height: 30),
              categoryTotals.isEmpty
                  ? const Text('No data to display')
                  : SizedBox(
                height: 200,
                child: PieChartWidget(categoryTotals: categoryTotals),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(thickness: 0.1),
              ),
              // after Divider
              Expanded(
                child: ListView.builder(
                  itemCount: categoryTotals.length,
                  itemBuilder: (context, index) {
                    final expense = controller.expenses[index];
                    final category = categoryTotals.keys.elementAt(index);
                    final amount = categoryTotals[category]!;
                    final total = controller.totalExpense.value.toDouble();
                    final double percent = total == 0 ? 0 : (amount / total);
                    return ListTile(
                      leading: Icon(
                        IconData(expense.iconCodePoint, fontFamily: 'MaterialIcons'),
                        color: Colors.blue, // optional
                      ),
                      title: Text(category),
                      subtitle: LinearProgressIndicator(
                        value: percent,
                        backgroundColor: Colors.grey[200],
                        color: Colors.blueAccent,
                      ),
                      trailing: Text('Rs ${amount.toStringAsFixed(0)}'),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}