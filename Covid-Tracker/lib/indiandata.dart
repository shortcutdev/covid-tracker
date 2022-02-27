import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class indian extends StatefulWidget {
  const indian({Key? key}) : super(key: key);

  @override
  _indianState createState() => _indianState();




}
class _indianState extends State<indian> {



  int? newconfirmed;
  int? totalconfirmed;
  int? totaldeaths;
  int? newdeaths;
  String? date;

  Future indiandata()  async{

    var res = await http.get(Uri.parse('https://api.covid19api.com/summary'));
    var map = await jsonDecode(res.body);

    var len = map["Countries"].length;
    for(var i =0; i<=len; i++){
      if(map["Countries"]![i]['Country'] == 'India' ){
       newconfirmed= map["Countries"]![i]['NewConfirmed'];
      totalconfirmed = map["Countries"]![i]['TotalConfirmed'];
       totaldeaths =  map["Countries"]![i]['TotalDeaths'];
       newdeaths = map["Countries"]![i]['NewDeaths'];
       date = map["Countries"]![i]['Date'];
       date = date?.substring(0,10);
       return date;
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(

        child: FutureBuilder(
          future: indiandata(),
          builder: (context, snapshot){

            if(snapshot.data != null){


              return Column(

                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      
                      color: Colors.green,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("\t\t\t Date  \n$date",
                      style: TextStyle(
              color: Colors.white,
                fontFamily: 'RobotoMono',
                fontSize: 25,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),),
                  ),
                  Expanded(
                    child: GridView.count(
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
                          child: Text("Total Confirmed\n $totalconfirmed",
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





