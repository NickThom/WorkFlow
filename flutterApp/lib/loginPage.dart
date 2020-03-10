import 'package:flutterApp/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterApp/EvaluatorPG.dart';
import 'package:flutterApp/passwordRecover.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Welcome', style: TextStyle(fontSize: 32)),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
  final _formKey = GlobalKey<FormState>();
  // final _mainKey = GlobalKey<FormState>();
  // bool loggedIn = false;
  var _email, _password;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
              //child:
              ),
          Center(
            //instead of hardcode 175, container can be infinity length but the widgets within can be centered to be center of the container.
            //or use media query class
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.40,
                  MediaQuery.of(context).size.width * 0.10,
                  MediaQuery.of(context).size.width * 0.40,
                  MediaQuery.of(context).size.width * 0.10),
              child: Column(children: <Widget>[
//////////////////////////////////////Text Fields
                new MyImageWidget(),

                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.red,
                      size: 24.0,
                    ),
                    hintText: 'Email',
                  ),
                  //Validation Section for Email Textfield
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Error: Email is empty.');
                    }

                    if (!value.contains('@')) {
                      return ('Please type in a valid email address');
                    }
                  },
                  onSaved: (str) {
                    _email = str;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.red,
                          size: 24.0,
                        ),
                        hintText: 'Password'),
                    //Validation Section for Password Textfield
                    validator: (value) {
                      if ((value.isEmpty) |
                          (value.length <= 7) |
                          (!value.contains(
                              new RegExp(r'[!@#$%^&*(),.?":{}|<>]')))) {
                        return ('Password is invalid.');
                      }
                    },
                    onSaved: (str) {
                      //Database shit goes here
                      _password = str;
                    },
                  ),
                ),

////////////////////////////////Submission Button
                RaisedButton(
                  onPressed: onPressed,
                  child: Text('LOG IN'),
                ),

                ForgotPasswordPopup(),
              
////////////////////////////

/////////////////////////////
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  void onPressed() {
    var form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        //    loggedIn = true;
        //got to landing page for jesus
        Navigator.push(
          context,
          //Comment me out and uncomment line under.
          MaterialPageRoute(builder: (context) => FirstRoute()),
        );
      });
    }
  }

}
