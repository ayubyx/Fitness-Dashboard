import 'package:dashboard/const/constants.dart';
import 'package:dashboard/util/reponsive.dart';
import 'package:dashboard/widgets/bar_graph_card.dart';
import 'package:dashboard/widgets/line_chart_card.dart';
import 'package:dashboard/widgets/menu.dart';
import 'package:dashboard/widgets/search.dart';
import 'package:dashboard/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/widgets/health.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      drawer: !isDesktop ? SizedBox(width: 250, child: Menu()) : SizedBox(),

      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              height: double.infinity,
              width: screenWidth(context) * 0.8,
              child: Summary(),
            )
          : null,

      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Row(
          children: [
            if (isDesktop)
              // drawer
              Expanded(flex: 2, child: Menu()),

            // search & charts
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Search(),
                      if (!Responsive.isMobile(context))
                        SizedBox(height: screenHeight(context) * 0.02),
                      Health(),
                      if (!Responsive.isMobile(context))
                        SizedBox(height: screenHeight(context) * 0.02),
                      ChartCard(),
                      if (!Responsive.isMobile(context))
                        SizedBox(height: screenHeight(context) * 0.02),
                      BarGraphCard(),
                      if (!Responsive.isMobile(context))
                        SizedBox(height: screenHeight(context) * 0.01),
                      if (Responsive.isTablet(context)) const Summary(),
                    ],
                  ),
                ),
              ),
            ),

            if (isDesktop)
              // sidebar
              Expanded(flex: 3, child: Summary()),
          ],
        ),
      ),
    );
  }
}
