import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:labelcheck/functions.dart';
import 'package:labelcheck/wikipediaIntegration.dart';

import 'aboutPage.dart';
import 'generated/l10n.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet(this.result, this.path) {
    parsedResult = Result(result);
  }

  static Result parsedResult;

  final String path;
  final List result;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.all(16),
                icon: Icon(Icons.help_center),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                ),
              ),
              Container(
                height: 6,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                margin: EdgeInsets.all(5),
              ),
              IconButton(
                padding: EdgeInsets.all(16),
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.2,
                width: 80,
                child: BarChart(
                  BarChartData(
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(show: false),
                    maxY: 1,
                    alignment: BarChartAlignment.center,
                    barGroups: [
                      BarChartGroupData(
                        barRods: [
                          BarChartRodData(
                            backDrawRodData: BackgroundBarChartRodData(
                              colors: [Colors.grey],
                              show: true,
                              y: 1,
                            ),
                            gradientColorStops: [0.1, 0.9],
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).accentColor,
                            ],
                            y: parsedResult.confidence,
                          )
                        ],
                        x: parsedResult.index,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    parsedResult.label,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Divider(),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                        style: TextStyle(),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => sendMailReport(path),
                child: Container(
                  child: Text(S.of(context).reportError),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).errorColor,
                        Colors.red,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await openWiki(await searchWiki(parsedResult.label));
                },
                child: Container(
                  child: Text(S.of(context).moreInfo),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
