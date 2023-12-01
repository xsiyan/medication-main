import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInsights extends StatefulWidget {
  const UserInsights({Key? key}) : super(key: key);

  @override
  _UserInsightsState createState() => _UserInsightsState();
}

class _UserInsightsState extends State<UserInsights> {
  final List<FlSpot> bloodPressureData = [
    FlSpot(DateTime(2023, 11, 1).day.toDouble(), 80),
    FlSpot(DateTime(2023, 11, 7).day.toDouble(), 90),
    FlSpot(DateTime(2023, 11, 15).day.toDouble(), 100),
    FlSpot(DateTime(2023, 11, 25).day.toDouble(), 120),
  ];
  final List<FlSpot> bloodSugarData = [
    FlSpot(DateTime(2023, 11, 1).day.toDouble(), 40),
    FlSpot(DateTime(2023, 11, 7).day.toDouble(), 55),
    FlSpot(DateTime(2023, 11, 15).day.toDouble(), 30),
    FlSpot(DateTime(2023, 11, 25).day.toDouble(), 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'INSIGHTS',
          style: GoogleFonts.firaSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Blood Pressure Data',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: FractionallySizedBox(
                heightFactor: 0.8,
                child: LineChart(
                  LineChartData(
                    minX: DateTime(2023, 11, 1).day.toDouble(),
                    maxX: DateTime(2023, 11, 30).day.toDouble(),
                    minY: 0,
                    maxY: 120,
                    titlesData: FlTitlesData(
                      rightTitles: SideTitles(
                        showTitles: false,
                        getTitles: (value) {
                          return value.toInt().toString();
                        },
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          final date = DateTime(2023, 11, value.toInt());
                          return '${date.day}/${date.month}';
                        },
                      ),
                      topTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: bloodPressureData,
                        isCurved: false,
                        barWidth: 2,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Blood Sugar Data',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: FractionallySizedBox(
                      heightFactor: 0.8,
                      child: LineChart(
                        LineChartData(
                          minX: DateTime(2023, 11, 1).day.toDouble(),
                          maxX: DateTime(2023, 11, 30).day.toDouble(),
                          minY: 10,
                          maxY: 60,
                          titlesData: FlTitlesData(
                            rightTitles: SideTitles(
                              showTitles: false,
                              getTitles: (value) {
                                return value.toInt().toString();
                              },
                            ),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTitles: (value) {
                                final date = DateTime(2023, 11, value.toInt());
                                return '${date.day}/${date.month}';
                              },
                            ),
                            topTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: bloodSugarData,
                              isCurved: false,
                              barWidth: 2,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
