import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:health_care_app/src/di/di.dart';
import 'package:health_care_app/src/presentation/home/store/home_store.dart';

class RealTimeChart extends StatefulWidget {
  const RealTimeChart({super.key});

  @override
  State<RealTimeChart> createState() => _RealTimeChartState();
}

class _RealTimeChartState extends State<RealTimeChart> {
  final HomeStore _homeStore = injector.get<HomeStore>();
  final List<FlSpot> _heartRateData = [];
  final List<FlSpot> _oxygenData = [];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final time = DateTime.now().minute * 60 + DateTime.now().second;
        _heartRateData.add(FlSpot(time.toDouble(), _homeStore.heartRate));
        _oxygenData.add(FlSpot(time.toDouble(), _homeStore.oxygen));

        // Limit the data points to 20 for better performance
        if (_heartRateData.length > 20) _heartRateData.removeAt(0);
        if (_oxygenData.length > 20) _oxygenData.removeAt(0);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: _heartRateData,
                    isCurved: true,
                    color: Colors.red,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: _oxygenData,
                    isCurved: true,
                    color: Colors.blue,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    left: BorderSide(color: Colors.white),
                    bottom: BorderSide(color: Colors.white),
                  ),
                ),
                gridData: const FlGridData(show: true),
                titlesData: const FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
