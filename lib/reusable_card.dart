import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.title, this.number, this.color});
  //decoration
  Color color;

  //functionality
  final String title;
  final dynamic number;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 120.0,
        width: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            )),
            SizedBox(height: 16.0),
            Center(
              child: number,
            ),
          ],
        ),
      ),
    );
  }
}
