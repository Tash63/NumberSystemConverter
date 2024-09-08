import 'package:conversion/conversion.dart';
import 'package:flutter/material.dart';

class Calcultor extends StatefulWidget {
  @override
  State<Calcultor> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calcultor> {
  @override
  //state variables
  String? _number1;
  String? _number2;

  void _Add() {
    //TODO
  }

  void _Subtract() {
    //TODO
  }

  void _Divide() {
    //TODO
  }

  void _Multiply() {
    //TODO
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rapid Tables Clone"),
        backgroundColor: Color.fromRGBO(253, 247, 231, 10),
      ),
      backgroundColor: Colors.lime,
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroundImage.jpg"),
                fit: BoxFit.cover)),
        child: Center(
            child: SizedBox(
                height: 555,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(253, 247, 231, 10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Number 1",
                            style: TextStyle(fontSize: 26),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          SizedBox(
                            height: 50,
                            width: 350,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Number 2",
                            style: TextStyle(fontSize: 26),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Result",
                            style: TextStyle(fontSize: 26),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                              width: 90,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: _Add,
                                child: Icon(Icons.add),
                              )),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 90,
                            height: 60,
                            child: ElevatedButton(
                                onPressed: _Subtract,
                                child: Icon(Icons.remove)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 90,
                            height: 60,
                            child: ElevatedButton(
                                onPressed: _Multiply, child: Icon(Icons.close)),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            height: 60,
                            width: 90,
                            child: ElevatedButton(
                                onPressed: _Divide,
                                child: Icon(Icons.access_alarm_outlined)),
                          )
                        ],
                      )
                    ],
                  ),
                ))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: "Convert"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Calculate")
        ],
        backgroundColor: Color.fromRGBO(253, 247, 231, 10),
        onTap: (value) {
          if (value == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
