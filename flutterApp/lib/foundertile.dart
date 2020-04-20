//Created on: 3/18/2020
//class FounderTile and FounderTileState:
//      Container, for the founder, that has interactable cards
//      different operations. The operations are as follows: add, remove, and edit
//Updated: 3/30/20 - added in editing and removing functions for the founder tile - JM

import 'package:flutter/material.dart';
import 'founderform.dart';
import 'foundrmv.dart';
import 'founderedit.dart';


class FounderTile extends StatefulWidget {
  @override
  FounderTileState createState() {
    return FounderTileState();
  }
}

class FounderTileState extends State<FounderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Founder Workshop",
                    style: new TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18,6,18,0),
              child: Card(
               // margin: EdgeInsets.zero,
                color: Colors.grey[600],
                child: ListTile(
                  dense: true,
                  onTap: founderAdd,
                  leading: Icon(
                    Icons.business,
                    color: Colors.green,
                  ),
                  title: Text(
                    'Add Founder',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Add a single founder',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.add_circle_outline,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18,6,18,0),
              child: Card(
                color: Colors.grey[600],
                child: ListTile(
                  dense: true,
                  onTap: removeFounder, //add remove functionality here
                  leading: Icon(
                    Icons.business,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Remove Founder',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Remove a founder',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18,6,18,0),
              child: Card(
                color: Colors.grey[600],
                child: ListTile(
                  dense: true,
                  onTap: editFounder, //add edit functionality here
                  leading: Icon(
                    Icons.business,
                    color: Colors.yellow,
                  ),
                  title: Text(
                    'Edit Founder',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Change founder information',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.mode_edit,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //function: founderAdd
  //          creates a popup dialog box that is used to input the company name
  //          of the founder. This data is stored in Google FireBase
  void founderAdd() {
    SimpleDialog box = SimpleDialog(
      title: Text(
        "Add Founder",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        FounderCustomForm(),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return box;
      },
    );
  }

  //function: removeFounder
  //          removes the choosen founder from the database in Google FireBase
  void removeFounder() {
    SimpleDialog box = SimpleDialog(
      title: Text(
        "Remove Founder",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[FounderRemove()],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return box;
      },
    );
  }

  //function: editFounder
  //          brings up a dialog box with prefilled data that can be edited, changes are pushed up to the database
  void editFounder() {
    SimpleDialog box = SimpleDialog(
      title: Text(
        "Edit Founder",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[FounderEdit()],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return box;
      },
    );
  }
}
