import 'package:dashboard/const/constants.dart';
import 'package:dashboard/data/scheduled_data.dart';
import 'package:dashboard/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Scheduled extends StatelessWidget {
  const Scheduled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ScheduleTasksData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: const Text(
            "Scheduled",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),

        SizedBox(height: screenHeight(context) * 0.03),

        for (var index = 0; index < data.scheduled.length; index++)
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomCard(
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.scheduled[index].title,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: screenHeight(context) * 0.001),
                            Text(
                              data.scheduled[index].date,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.more, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
