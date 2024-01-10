import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:flutter_nexmuv/app/models/crypto_model.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.crypto});

  final List<CryptoModel> crypto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: AspectRatio(
        aspectRatio: 1.15,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 2.0, right: 6.0),
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: Colors.amber,
                  barWidth: 4,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.amber.shade600,
                        Colors.amber.withOpacity(0.3),
                      ],
                    ),
                  ),
                  spots: [
                    ...crypto.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final item = entry.value;

                        return FlSpot(
                          (index + 1).toDouble(),
                          double.parse(
                            item.quote.toStringAsFixed(2),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
              titlesData: const FlTitlesData(
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
