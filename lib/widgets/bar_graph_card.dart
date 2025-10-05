import 'package:dashboard/const/constants.dart';
import 'package:dashboard/data/bar_graph_data.dart';
import 'package:dashboard/model/graph_model.dart';
import 'package:dashboard/util/reponsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphCard extends StatelessWidget {
  const BarGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    final barGraphData = BarGraphData();

    return GridView.builder(
      shrinkWrap: true,
      itemCount: barGraphData.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12,
        childAspectRatio: 5 / 4,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Color(0xFF2F353E),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          height: Responsive.isMobile(context)
              ? screenHeight(context) * 0.5
              : screenHeight(context) * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  barGraphData.data[index].label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),

              Expanded(
                child: BarChart(
                  BarChartData(
                    //minY: 1,
                    maxY: Responsive.isMobile(context) ? 12 : 14,
                    barGroups: _chartGroups(
                      points: barGraphData.data[index].graph,
                      color: barGraphData.data[index].color,
                    ),
                    borderData: FlBorderData(border: Border()),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                barGraphData.label[value.toInt()],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<BarChartGroupData> _chartGroups({
  required List<GraphModel> points,
  required Color color,
}) {
  return points
      .map(
        (point) => BarChartGroupData(
          x: point.x.toInt(),
          barRods: [
            BarChartRodData(
              toY: point.y,
              width: 12,
              color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
          ],
        ),
      )
      .toList();
}
