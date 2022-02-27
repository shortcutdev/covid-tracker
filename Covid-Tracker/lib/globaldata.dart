import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid_tracker/indiandata.dart';

class global extends StatefulWidget {
  const global({Key? key}) : super(key: key);

  @override
  _globalState createState() => _globalState();
}
class _globalState extends State<global> {



   int? newconfirmed;
   int? totalconfirmed;
   int? totaldeaths;
   int? newdeaths;

  Future globaldata()  async{

     var res = await http.get(Uri.parse('https://api.covid19api.com/summary'));
     var ss = await jsonDecode(res.body);
      newconfirmed = ss['Global']['NewConfirmed'];
      totalconfirmed = ss['Global']['TotalConfirmed'];

      newdeaths = ss['Global']['NewDeaths'];
      totaldeaths = ss['Global']['TotalDeaths'];
     return newconfirmed;

    }


void _init(){
    super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("global cases"),
        centerTitle: true,
      ),
      body:Container(

        child: FutureBuilder(
          future: globaldata(),
          builder: (context, snapshot){

            if(snapshot.data != null){
              //print(s!['Global']['NewConfirmed']);

              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("New Confirmed \n $newconfirmed",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("Total Confirmed\n $totaldeaths",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("New Deaths\n $newdeaths",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("Total Deaths\n$totaldeaths",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),


      ),
    );
  }
}





