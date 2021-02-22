import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double height;
  final double weight;

  Result(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));

    return Scaffold(
        appBar: AppBar(
            title: Text('다시 검사 하기!')
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _calculate(bmi),
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(height: 20,),
                _sketchIcon(bmi),
              ],
            )
        )
    );
  }

  Widget _sketchIcon(bmi) {

    if(bmi >= 23) {
      return Icon(
        Icons.sentiment_very_dissatisfied,
        size: 100,
        color: Colors.red,
      );
    } else if(bmi >= 18.5) {
      return Icon(
        Icons.sentiment_neutral,
        size: 100,
        color: Colors.lightGreen,
      );
    } else {
      return Icon(
        Icons.sentiment_very_dissatisfied,
        size: 100,
        color: Colors.amber,
      );
    }
  }

  String _calculate(bmi) {
    var result = '';

    if(bmi >= 35) {
      result = '고도 비만 입니다.';
    } else if(bmi >= 30) {
      result = '2단계 비만 입니다.';
    } else if(bmi >= 25) {
      result = '1단계 비만 입니다.';
    } else if(bmi >= 23) {
      result = '과체중 입니다.';
    } else if(bmi >= 18.5) {
      result = '정상 입니다!';
    } else {
      result = '저체중 입니다.ㅠ';
    }
    return result;
  }
}