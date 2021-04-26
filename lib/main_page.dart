import 'package:covid19info/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19info/networking.dart';


String url = 'https://covid19.mathdro.id/api';
String data;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

    NetworkHelper networkHelper = NetworkHelper(url);
  @override
  void initState() {
    networkHelper.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Covid 19 Info',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ReusableCard(
                color: Colors.grey[700],
                title: 'Confirmed:',
                number:networkHelper.updateNumber('confirmed','value'),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              flex: 1,
              child: ReusableCard(
                color: Colors.green[900],
                title: 'Recovered:',
                number:networkHelper.updateNumber('recovered','value'),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              flex: 1,
              child: ReusableCard(
                color: Colors.red[900],
                title: 'Deaths:',
                number:networkHelper.updateNumber('deaths','value'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}