import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class NetworkHelper {
  NetworkHelper(this.url);
// url to be used: https://covid19.mathdro.id/api
  final String url;

  Future<Map> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  // from C:\Users\Sabson\Desktop\Flutter & Dart – The Complete Flutter App Development -[Tutsgalaxy.com] -  Course\22 Flutter - Build the Klimatic Weather App\ 147 how to send data between screens
  //TODO: change the return type from text to reusable card
  //TODO: give the function string parameters so we can change the values depending on what we want eg: comfirmed, infected, death etc...
  //future builder takes a future (which in our case is the get data function) and uses the snapshot to get the data and return it as a map like we initialized it.
  Widget updateNumber(String status, String value) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return Text(
              content[status][value].toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            );
          } else {
            return Text('No Data', style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),);
          }
        });
  }
}
