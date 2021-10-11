import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart';

class AnimatedCharts extends StatefulWidget {
  AnimatedCharts({Key key}) : super(key: key);

  @override
  _AnimatedChartsState createState() => _AnimatedChartsState();
}

class _AnimatedChartsState extends State<AnimatedCharts> {
  // List<charts.Series<Task, String>> _seriesPieData;
  // dynamic _generateData() {
  //   var pieData = [
  //     Task('Work', 35.8, Color()),
  //     Task('Eat', 8.3, Color()),
  //     Task('Travel', 10.8, Color()),
  //     Task('Clothes', 15.6, Color()),
  //     Task('Fees', 19.2, Color()),
  //     Task('Other', 10.3, Color()),
  //   ];

  //   _seriesPieData.add(charts.Series(
  //     data: pieData,
  //     domainFn: (Task task, _) => task,
  //     measureFn: (Task task, _) => task.taskValue,
  //     colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colorVal),
  //     id: 'Daily Task',
  //     labeAccessorFn: (Task row, _) => '${row.taskValue}',
  //   ));
  // }

  @override
  void initState() {
    super.initState();
    // _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: null,
            leadingWidth: 0,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartPie),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartLine))
              ],
            ),
          ),
          body: TabBarView(children: [
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Container(
            //     child: Center(
            //       child: Column(
            //         children: [
            //           Text('Solid chart bar'),
            //           Expanded(
            //               child: charts.PieChart(_seriesPieData,
            //                   animate: true,
            //                   animationDuration: Duration(seconds: 5),
            //                   behaviors: [
            //                     charts.DatumLegend(
            //                         OutsideJustification:
            //                             charts.OutsideJustification.endDrawArea,
            //                         horizontalFirst: false,
            //                         desiredMaxRow: 2,
            //                         cellPading: EdgeInsets.only(
            //                             right: 4.0, bottom: 4.0),
            //                         entryTextStyle: charts.TextStyleSpec(
            //                             color: charts.MaterialPalette.purple
            //                                 .shadeDefault,
            //                             fontFamily: 'Georgia',
            //                             fontSize: 11))
            //                   ],
            //                   defaultRenderer: charts.ArcRenderConfig(
            //                       arcWidth: 100,
            //                       arcRendererDecorators: [
            //                         charts.ArcLabelDecorator(
            //                             labelPosition:
            //                                 charts.ArcLabelPosition.inside)
            //                       ])))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child: Text('solidChartBar'),
            ),
            Center(child: Text('CharPieSolidchartBar')),
            Center(child: Text('Chart Line')),
          ]),
        ));
  }
}

class Task {
  String task;
  double taskValue;
  Color colorVal;

  Task(this.task, this.taskValue, this.colorVal);
}
