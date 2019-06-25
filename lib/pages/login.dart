import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ListView(
        //padding: EdgeInsets.symmetric(horizontal: 24.0),
        padding: EdgeInsets.fromLTRB(15.0, 1.0, 15.0, 5.0),
        children: <Widget>[
          SizedBox(height: 30.0,),
          Column(
          children: <Widget>[
            Image.asset('images/chef-logo.jpg'),
            SizedBox(height: 20.0,),
            //Text('LOGIN'),
        ],
      ),
          SizedBox(height: 45.0,),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '    Enter your number',
              //filled: true,
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('Continue',style: TextStyle(fontStyle: FontStyle.italic)),
                onPressed: (){},
                color: Colors.blueGrey,
              )
            ],
          )
        ],
      )),
    );

  }
}
