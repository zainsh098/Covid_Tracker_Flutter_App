import 'dart:convert';
import 'package:covid_tracker_app/Models/WorldStatsModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


import 'Utillities/app_ui.dart';


class StatsServices
{

  Future<WorldStatsModel> fetchStats ( ) async
  {
    final response = await http.get(Uri.parse(AppUrl.baseurl));

    if (response.statusCode == 200) {
        var data=jsonDecode(response.body.toString());
        return WorldStatsModel.fromJson(data);

    }

    else{
      throw Exception('Error');




    }


    
    
    
  }

  Future<List<dynamic>> fetchCountryList() async
  {
    final response = await http.get(Uri.parse(AppUrl.baseurl));
    var data;
    if (response.statusCode == 200) {
      jsonDecode(response.body.toString());
      return data;
    }

    else {
      throw Exception('Error');
    }
  }


}

