import 'package:covid_tracker/indiandata.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/globaldata.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  var padding = 10.0;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Tracker"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

      Container(
      child: RaisedButton(
        color: Colors.amber,
        elevation: 10.0,
        padding: EdgeInsets.all(padding * 3),
        child: Center(
          child: Row(
            children: <Widget>[

              Image.asset('images/globicon.png',
                width: 30,
                height: 30,),

              Text(
                "    Global",
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return global();
          }));
        },
      ),

      margin: EdgeInsets.all(15.0),
    ),

           Container(

            child: Expanded(
              child: indian(),
       )
     ),

    ],
    ),

    );
  }
}



