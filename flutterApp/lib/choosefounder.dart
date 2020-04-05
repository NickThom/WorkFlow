import 'package:flutter/material.dart';
import 'founder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'questionaire.dart';
//import 'package:url_launcher/url_launcher.dart';

class ChooseFounder extends StatefulWidget
{
  @override
  ChooseFounderState createState()
  {
    return ChooseFounderState();
  }
}

class ChooseFounderState extends State<ChooseFounder>
{
  //fetches the data from the database
  Future<List<Founder>> fetchedFounder() async {
    const url = 'https://projectworkflow.firebaseio.com/Founder.json';
    final response = await http.get(url);
    Map<String, dynamic> fetchedEvaluatorsList = json.decode(response.body);
    dynamic valuesFromMap = fetchedEvaluatorsList.values;
    List<Founder> founderList = new List();
    //keys = fetchedEvaluatorsList.keys;

    for (var v in valuesFromMap) {
      Founder found = Founder(foundry: v['foundry']);
      founderList.add(found);
    }
    return founderList;
  }

  @override 
  Widget build(BuildContext context)
  {
    return Container(
      height: MediaQuery.of(context).size.height * .40,
      width: MediaQuery.of(context).size.width * .25,
      color: Colors.grey[350],
      child: FutureBuilder(
        future: fetchedFounder(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return new Card(
                  child: ListTile(
                    leading: Icon(Icons.business),
                    title: Text('${snapshot.data[index].foundry}'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Questionaire(startup: snapshot.data[index].foundry,),),);},
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(
              "Error: ${snapshot.error}",
            );
          }
          return SizedBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
              strokeWidth: 10,
            ),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .05,
          );
        },
      ),
    );
  }
}