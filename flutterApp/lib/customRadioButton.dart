import 'package:flutter/material.dart';
import './questionaire.dart';

class CustomRadioButton extends StatefulWidget {
  final int index;

  CustomRadioButton(this.index, {Key key}) : super(key: key);
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState(index);
}

ScoreValue(int score) {
  if (score == 1) {
    return Container(
      constraints: BoxConstraints(minWidth: 110, maxWidth: 200),
      child: Text(
        "Poor",
        style: TextStyle(
          shadows: [
            Shadow(
              blurRadius:  1.5,
              color: Colors.black,
              offset: Offset(2, 1),
            ),
          ],
          color: Colors.red[400],
          fontSize: 20,
        ),
      ),
    );
  } else if (score == 2) {
    return Container(
      constraints: BoxConstraints(minWidth: 110, maxWidth: 200),
      child: Text(
        "Fair",
        style: TextStyle(
          shadows: [
            Shadow(
              blurRadius:  0.5,
              color: Colors.black,
              offset: Offset(1.5, 1.5),
            ),
          ],
          color:Colors.orange,
          fontSize: 20,
        ),
      ),
    );
  } else if (score == 3) {
    return Container(
      constraints: BoxConstraints(minWidth: 110, maxWidth: 200),
      child: Text(
        "Good",
        style: TextStyle(
          shadows: [
            Shadow(
              blurRadius:  0.5,
              color: Colors.black,
              offset: Offset(1, 1),
            ),
          ],
           fontWeight: FontWeight.bold,
          color: Colors.yellow,
          fontSize: 20,
        ),
      ),
    );
  } else if (score == 4) {
    return Container(
      constraints: BoxConstraints(minWidth: 110, maxWidth: 200),
      child: Text(
        "Very Good",
        style: TextStyle(
          shadows: [
            Shadow(
              blurRadius:  0.5,
              color: Colors.black,
              offset: Offset(1.5, 1.5),
            ),
          ],
          color: Colors.limeAccent[400],
          fontSize: 20,
        ),
      ),
    );
  } else if (score == 5) {
    return Container(
      constraints: BoxConstraints(minWidth: 110, maxWidth: 200),
      child: Text(
        "Excellent",
        style: TextStyle(
          shadows: [
            Shadow(
              blurRadius: 0.5,
              color: Colors.black,
              offset: Offset(1.5, 1.5),
            ),
          ],
          color: Colors.green,
          fontSize: 20,
        ),
      ),
    );
  } else {
    return Container(
      constraints: BoxConstraints(minWidth: 110, maxWidth: 200),
      child: Text(
        "No Score",
        style: TextStyle(
          color: Colors.black,
//          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int selectedValue = 0;
  int index;
  _CustomRadioButtonState(this.index);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ScoreValue(selectedValue),
        Radio(
          value: 1,
          groupValue: selectedValue,
          activeColor: Colors.red,
          onChanged: (val) {
            setState(() {
              selectedValue = val;
              setValue(index, val);
            });
          },
        ),
        Radio(
          value: 2,
          groupValue: selectedValue,
          activeColor: Colors.orange,
          onChanged: (val) {
            setState(() {
              selectedValue = val;
              setValue(index, val);
            });
          },
        ),
        Radio(
          value: 3,
          groupValue: selectedValue,
          activeColor: Colors.yellow,
          onChanged: (val) {
            setState(() {
              selectedValue = val;
              setValue(index, val);
            });
          },
        ),
        Radio(
          value: 4,
          groupValue: selectedValue,
          activeColor: Colors.limeAccent[400],
          onChanged: (val) {
            setState(() {
              selectedValue = val;
              setValue(index, val);
            });
          },
        ),
        Radio(
          value: 5,
          groupValue: selectedValue,
          activeColor: Colors.green,
          onChanged: (val) {
            setState(() {
              selectedValue = val;
              setValue(index, val);
            });
          },
        ),
      ],
    );
  }
}
