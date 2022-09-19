
import 'dart:math' as math;
import 'dart:async';

import 'package:covid_tracker_app/Screens/countries_list.dart';
import 'package:covid_tracker_app/Screens/world_stats.dart';
import 'package:flutter/material.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({Key? key}) : super(key: key);

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen>   with TickerProviderStateMixin{

  var size;
  late final AnimationController _controller=AnimationController(
      duration: Duration(minutes: 1),


      vsync: this)..repeat();



  @override
  void initState() {

    Timer.periodic(Duration(seconds: 7), (timer) {

      Navigator.push(context, MaterialPageRoute(builder: (context) => CountryList(),));

    });


    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      size=MediaQuery.of(context).size;



    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Center(child: Image(image: AssetImage('images/virus.png'))),
            AnimatedBuilder(
              animation: _controller,
              child: Container(

                color: Colors.amber,
                width: 200,
                height: 200 ,





              ),


               builder: (context, child) {

              return Transform.rotate(angle: _controller.value * 2 * math.pi);


            },),
            SizedBox(height: MediaQuery.of(context).size.height *.08,),
            Align(
                alignment: Alignment.center,
                child: Text('Covid Tracker App ',textAlign: TextAlign.center,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),))
            
            
          ],
          
          
          
          
        ),
      ),


    );
  }
}
