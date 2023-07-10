import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomGraphic extends ConsumerWidget {
  final List<FlSpot> datas;
  final SideTitles bottomTitle;

  const CustomGraphic(
      {super.key, required this.datas, required this.bottomTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: LineChart(LineChartData(
          lineBarsData: [
            LineChartBarData(
                spots: datas.map((coin) => FlSpot(coin.x, coin.y)).toList(),
                isCurved: true,
                color: Colors.blue),
          ],
          borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide())),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: bottomTitle),
          ))),
    ));
  }
}
