import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  int total = 0;
  String appbar = 'Quiz';
  var datas = [
    {
      'questions': 'What is the color moon?',
      'answers': [
        {
          'name': 'Ash',
          'score': 50,
        },
        {
          'name': 'White',
          'score': 40,
        },
        {
          'name': 'Blue',
          'score': 60,
        },
        {
          'name': 'Gray',
          'score': 90,
        },
      ],
    },
    {
      'questions': 'Which is the black bird ?',
      'answers': [
        {
          'name': 'Penguin',
          'score': 70,
        },
        {
          'name': 'Eagle',
          'score': 60,
        },
        {
          'name': 'Crow',
          'score': 50,
        },
        {
          'name': 'Pegion',
          'score': 40,
        },
      ],
    },
    {
      'questions': 'What is your place ?',
      'answers': [
        {
          'name': 'Paris',
          'score': 60,
        },
        {
          'name': 'Spain',
          'score': 50,
        },
        {
          'name': 'Singapore',
          'score': 40,
        },
        {
          'name': 'India',
          'score': 30,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('$appbar'),
          backgroundColor: Colors.brown,
          centerTitle: true,
        ),
        body: (index < 3)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    width: double.infinity,
                    child: Text(
                      '${datas[index]['questions']}',
                      style: TextStyle(fontSize: 25.5),
                    ),
                    color: Colors.black45,
                    alignment: Alignment.center,
                  ),
                  Container(
                    color: Colors.brown,
                    height: 579,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: (datas[index]['answers'] as List).map((answer) {
                        return Container(
                          width: 170.0,
                          height: 40.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (index < 3) {
                                  total = total + answer['score'];
                                  index++;
                                  print(total);
                                }
                              });
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.black),
                            child: Text(
                              '${answer['name']}   ${answer['score'].toString()}',
                              style: TextStyle(fontSize: 20.5),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            : Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total score is $total',
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                      ElevatedButton(
                          child: Text('Reset'),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.brown),
                          onPressed: () {
                            setState(() {
                              total = 0;
                              index = 0;
                            });
                          })
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
