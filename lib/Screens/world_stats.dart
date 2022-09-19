import 'dart:io';

import 'package:covid_tracker_app/Models/WorldStatsModel.dart';
import 'package:covid_tracker_app/Services/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'countries_list.dart';


class WorldStats extends StatefulWidget {
  const WorldStats({Key? key}) : super(key: key);

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {

  late final AnimationController _controller=AnimationController(
      duration: Duration(days: 1),


      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

    final colorlist=<Color>[

      Color(0xff4285f4),
      Color(0xff1aa260),
      Color(0xffde5246)


    ];




  @override
  Widget build(BuildContext context) {
    StatsServices statsServices=StatsServices();


    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [

          SizedBox(height: MediaQuery.of(context).size.height*.02   ,),
          FutureBuilder(
            future: statsServices.fetchStats(),
            builder: (context, AsyncSnapshot<WorldStatsModel>snapshot) {
           Future.delayed(Duration(minutes: 1));


              if(!snapshot.hasData)
                {

                  return  Expanded(
                    flex: 1,

                      child:SpinKitFadingCircle(



                  color: Colors.white,
                        size: 50.0,
                        controller: _controller,

                      ),


                  );

                }
              else
                {
                        return Column(

                          children: [

                            PieChart(dataMap: {

                              "Total :": double.parse(snapshot.data!.cases!.toString()),
                              "Recovered:":double.parse(snapshot.data!.recovered.toString()),
                              "Deaths:":double.parse(snapshot.data!.deaths.toString()),


                            },
                              chartValuesOptions: ChartValuesOptions(

                                showChartValuesInPercentage: true,
                              ),
                              chartRadius: MediaQuery.of(context).size.width /3,
                              chartType: ChartType.ring,
                              colorList: colorlist,
                              animationDuration: Duration(milliseconds: 1200),

                            ),
                            SizedBox(height: MediaQuery.of(context).size.height *0.03,),
                            Card(
                              child: Column(
                                children: [

                                  ReuseableRow(title: 'Total', value: snapshot.data!.cases.toString()),
                                  ReuseableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                                  ReuseableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                                  ReuseableRow(title: 'Active', value: snapshot.data!.active.toString()),
                                  ReuseableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                                  ReuseableRow(title: 'Total Deaths ', value: snapshot.data!.todayDeaths.toString()),
                                  ReuseableRow(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),



                                ],

                              ),


                            ),
                            SizedBox(height: 50,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CountryList()));



                              },



                              child: Container(
                                height: 60,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(13),



                                ),
                                child: Center(child: Text('Track & Countries ',style: TextStyle(fontSize: 18),)),


                              ),
                            ) ,





                          ],

                        );

                }






          },),



          ],


        ),
      )),



    );
  }
}


class ReuseableRow extends StatelessWidget {
  String title,value;


 ReuseableRow({Key? key,required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
          Text(value),



          ],

        ),





        ],


      ),
    );
  }
}
