import 'package:dashboard/const/constants.dart';
import 'package:dashboard/util/reponsive.dart';

import 'package:flutter/material.dart';

class SummaryDetails extends StatelessWidget {
  const SummaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context)
          ? screenWidth(context) * 0.65
          : screenWidth(context) * 0.50,
      decoration: BoxDecoration(
        color: const Color(0xFF2F353E),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: screenWidth(context) * 0.03,
        children: [
          customColumn(title: "Cal", value: "305"),
          customColumn(title: "Steps", value: "10983"),
          customColumn(title: "Distance", value: "7Km"),
          customColumn(title: "Sleep", value: "7hr"),
        ],
      ),
    );
  }
}

Widget customColumn({required String title, required String value}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
      Text(
        value,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
