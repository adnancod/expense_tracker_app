import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final Map<String, double> categoryTotals;

  const PieChartWidget({super.key, required this.categoryTotals});

  @override
  Widget build(BuildContext context) {
    final total = categoryTotals.values.fold(0.0, (a, b) => a + b);
    final colorList = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
    ];

    final pieSections = <PieChartSectionData>[];
    final legends = <Widget>[];

    int index = 0;
    categoryTotals.forEach((category, amount) {
      final percentage = (amount / total * 100).toStringAsFixed(1);

      pieSections.add(
        PieChartSectionData(
          color: colorList[index % colorList.length],
          value: amount,
          title: '$percentage%',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );

      legends.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: colorList[index % colorList.length],
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$category - $percentage%',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );

      index++;
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40, // makes it a donut
                sections: pieSections,
              ),
            ),
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: legends,
            ),
          ),
        )
      ],
    );
  }
}
