import 'package:flutter/material.dart';
import 'bmi_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '나만의 비만도 확인 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputForm(),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {

    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('나만의 비만도 확인 앱!'),
        ),
        body: Center(
          child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '키',
                        ),
                        keyboardType: TextInputType.number,
                        controller: _heightController,
                        validator: (value) {
                          if(value.trim().isEmpty) {
                            return '키를 입력 하세요!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '몸무계'
                        ),
                        keyboardType: TextInputType.number,
                        controller: _weightController,
                        validator: (value) {
                          if(value.trim().isEmpty) {
                            return '몸무계를 입력 하세요!';
                          }
                          return null;
                        },
                      ),
                      Container(
                          margin: const EdgeInsets.all(20.0),
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            onPressed: () {

                              if(_formKey.currentState.validate()) {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Result(
                                        double.parse(_heightController.text.trim()),
                                        double.parse(_weightController.text.trim())
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text('확인'),
                          )
                      )
                    ],
                  )
              )
          ),
        )
    );
  }
}