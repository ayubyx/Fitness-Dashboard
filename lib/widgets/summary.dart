import 'package:dashboard/const/constants.dart';
import 'package:dashboard/widgets/pie_chart.dart';
import 'package:dashboard/widgets/scheduled.dart';
import 'package:dashboard/widgets/summary_details.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: cardBackgroundColor,
        child: Column(
          children: [
            SizedBox(height: screenHeight(context) * 0.10),
            Chart(),
            SizedBox(height: screenHeight(context) * 0.05),
            Text(
              "Summary",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight(context) * 0.03),
            Padding(padding: const EdgeInsets.all(10), child: SummaryDetails()),
            SizedBox(height: screenHeight(context) * 0.05),
            Scheduled(),
          ],
        ),
      ),
    );
  }
}
