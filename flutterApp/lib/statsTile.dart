import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Statistics {
  int avgFormScores = 0;

  Statistics({this.avgFormScores});

  factory Statistics.setScroes(dynamic mapForFormCount, int index) {
    return Statistics(
      avgFormScores: mapForFormCount['storedValues'][index],
    );
  }
}

Future<double> fetchStats() async {
  const formURL = 'https://projectworkflow.firebaseio.com/Assessments.json';

  final formJsonResponse = await http.get(formURL);

  Map<String, dynamic> mapOfFetchedForms = json.decode(formJsonResponse.body);

  int overallScoreIndex = 11;
  int tempInt = 0;

  dynamic valuesOfMapOfFetchedForms = mapOfFetchedForms.values;

  print(valuesOfMapOfFetchedForms);

  for (var temp in valuesOfMapOfFetchedForms) {
    Statistics overallScoreHolder =
        new Statistics.setScroes(temp, overallScoreIndex);
    if (overallScoreHolder.avgFormScores != null) {
      tempInt = tempInt + overallScoreHolder.avgFormScores;
    }
  }

  return (tempInt / mapOfFetchedForms.length);
}

class StatsTile extends StatefulWidget {
  @override
  StatsTileState createState() {
    return StatsTileState();
  }
}

class StatsTileState extends State<StatsTile> {
  // @override

  Widget fetchStatz = FutureBuilder<double>(
    future: fetchStats(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(
          child: Center(
            child: Column(
              children: <Widget>[
                CircularPercentIndicator(
                  header: AutoSizeText(
                    'Overall Rating Given',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  radius: MediaQuery.of(context).size.height * .25,
                  animation: true,
                  animationDuration: 2000,
                  lineWidth: MediaQuery.of(context).size.height * .015,
                  percent: snapshot.data / 5,
                  reverse: false,
                  arcBackgroundColor: Colors.red,
                  arcType: ArcType.FULL,
                  center: AutoSizeText(
                    "${(snapshot.data).toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    maxFontSize: 26,
                    maxLines: 1,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.transparent,
                  progressColor: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .033,
                    0,
                    0,
                    0,
                  ),
                  child: Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Expanded(
                          child: Text(
                            "This number represents the forms' overall score",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (snapshot.hasError) {
        return new Text("${snapshot.error}");
      }

      // By default, show a loading spinner
      return new CircularProgressIndicator();
    },
  );

//////////////////////////////////////////////

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.all(8),

      //child: fetchStatz,
      child: Column(
        children: <Widget>[
          fetchStatz,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     Icon(
          //       Icons.info_outline,
          //       size: 16,
          //       color: Colors.white,
          //     ),
          //     SizedBox(width: MediaQuery.of(context).size.width * 0.01   ),
          //     Expanded(
          //                     child: Text(
          //         "This number represents the forms' overall score",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
