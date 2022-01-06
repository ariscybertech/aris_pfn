import 'package:flutter/material.dart';
import 'package:project_2_forms_navigation/secondPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Forms and Navigation",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (val) {
                      if(val.isEmpty) {
                        return "This field can not be empty";
                      }
                      if(val!= 'test@test') {
                        return 'Invalid Email';
                      }
                      if (val.contains('@')) {
                        return null;
                      }
                        return "This is invalid email." ;
                    },
                    decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),),
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (val) {
                      if(val.isEmpty) {
                        return "This field can not be empty";
                      }
                      if(val != 'test') {
                        return 'invalid password';
                      }
                      return null ;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => SecondPage(),),
                );
              } else {
                print("Invalid Data");
              }
            },
            color: Colors.red,
            child: Text(
              "Print Data.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
