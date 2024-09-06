import 'package:flutter/material.dart';
import 'package:conversion/conversion.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // state variables
  _radix? _input_radix = _radix.Binary;
  _radix? _output_radix = _radix.Decimal;
  int? _current_input = 0;
  int? _current_output = 1;
  String? input_value;

  _radix? getselectedradix(int? state) {
    _radix? selected = null;
    switch (state) {
      case 0:
        selected = _radix.Binary;
        break;
      case 1:
        selected = _radix.Decimal;
        break;
      case 2:
        selected = _radix.Octal;
        break;
      case 3:
        selected = _radix.Hex;
        break;
      default:
        break;
    }
    return selected;
  }

  final TextEditingController _outputtext = TextEditingController();
  final TextEditingController _inputtext = TextEditingController();
  final TextEditingController _inputdrop = TextEditingController();
  final TextEditingController _outputdrop = TextEditingController();

  String _getRadixString(_radix? radix) {
    String OutputString = "";

    switch (radix) {
      case _radix.Binary:
        OutputString = _radix.Binary.name;
        break;
      case _radix.Decimal:
        OutputString = _radix.Decimal.name;
        break;
      case _radix.Octal:
        OutputString = _radix.Octal.name;
        break;
      case _radix.Hex:
        OutputString = _radix.Hex.name;
        break;
      default:
        break;
    }
    return OutputString;
  }

  void _inputchange(int? newState) {
    setState(() {
      //get the index
      if (newState != null) {
        _radix? temp_state = getselectedradix(newState);
        if (temp_state != _output_radix) {
          _input_radix = temp_state;
          _current_input = newState;
          _convert();
        } else {
          _inputdrop.text = _getRadixString(_input_radix);
        }
      }
    });
  }

  void _outputchange(int? newState) {
    setState(() {
      //get the index
      if (newState != null) {
        _radix? temp_state = getselectedradix(newState);
        if (temp_state != _input_radix) {
          _output_radix = temp_state;
          _current_output = newState;
          _convert();
        } else {
          _outputdrop.text = _getRadixString(_output_radix);
        }
      }
    });
  }

  void _convert() {
    //ToDo
    //convert all inputs to binary so it is easier to convert from that base to other bases
    //perform validation testing later
    Convert convert = Convert();
    String BinaryInput = "";
    switch (_input_radix) {
      case _radix.Binary:
        {
          BinaryInput = input_value ?? "0";
          break;
        }
      case _radix.Decimal:
        {
          BinaryInput = (convert
              .decimalToBinary(values: [int.parse(input_value ?? "0")])).first;
          break;
        }
      case _radix.Octal:
        {
          //convert to decimal
          String temp = "";
          int DecimalValue = 0;
          num max_radix = pow(8, (input_value?.length ?? 1) - 1);
          for (int i = 0; i < (input_value?.length ?? 0); i++) {
            DecimalValue +=
                max_radix.floor() * ((input_value?.codeUnitAt(i) ?? 0) - 48);
            max_radix = max_radix / 8;
          }
          BinaryInput = (convert.decimalToBinary(values: [DecimalValue])).first;
          break;
        }
      case _radix.Hex:
        {
          BinaryInput =
              (convert.hexToBinary(values: [input_value ?? ""])).first;
          _outputtext.text = BinaryInput;
        }
      default:
        {
          break;
        }
    }
    String result = "";
    //convert the binary string to the desired value
    switch (_output_radix) {
      case _radix.Binary:
        {
          result = BinaryInput;
          break;
        }
      case _radix.Decimal:
        {
          result = ((convert.binaryTodecimal(values: [BinaryInput])).first)
              .toString();
          break;
        }
      case _radix.Octal:
        {
          //convert to Binary to decimal
          String temp = "";
          num maxpow = pow(2, BinaryInput.length - 1);
          int DecimalValue = 0;
          for (int i = 0; i < BinaryInput.length; i++) {
            DecimalValue += maxpow.floor() * (BinaryInput.codeUnitAt(i) - 48);
            temp += DecimalValue.toString() + " ";
            maxpow = maxpow / 2;
          }
          result = ((convert.decimalToOctal(values: [DecimalValue])).first)
              .toString();
          break;
        }
      case _radix.Hex:
        {
          result = (convert.binaryToHex(values: [BinaryInput])).first;
          break;
        }
      default:
        {
          break;
        }
    }
    _outputtext.text = result;
  }

  void _clear() {
    _outputtext.text = "";
    _inputtext.text = "";
  }

  void _swap() {
    setState(() {
      _radix? temp = _input_radix;
      _outputdrop.text = _getRadixString(_input_radix);
      _inputdrop.text = _getRadixString(_output_radix);
      _input_radix = _output_radix;
      _output_radix = temp;
    });
  }

  @override
  void initState() {
    _inputdrop.text = "Binary";
    _outputdrop.text = "Deciaml";
  }

  @override
  Widget build(BuildContext context) {
    //determine the radix for input and output
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(253, 247, 231, 10),
        title: Text("Rapid Tables Clone"),
      ),
      backgroundColor: Colors.lime,
      body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backgroundImage.jpg"),
                  fit: BoxFit.cover)),
          child: Column(children: [
            SizedBox(
              height: 105,
            ),
            SizedBox(
              height: 555,
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(253, 247, 231, 10)),
                child: Center(
                    child: Column(
                        children: [
                      Text(
                        "${_getRadixString(_input_radix)} to ${_getRadixString(_output_radix)} Converter",
                        style: TextStyle(
                            fontSize: 32, fontStyle: FontStyle.italic),
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
                            "From",
                            style: TextStyle(fontSize: 26),
                          ),
                          SizedBox(
                            width: 145,
                          ),
                          Text(
                            "To",
                            style: TextStyle(fontSize: 26),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          DropdownMenu(
                            dropdownMenuEntries: [
                              DropdownMenuEntry(value: 0, label: "Binary"),
                              DropdownMenuEntry(value: 1, label: "Decimal"),
                              DropdownMenuEntry(value: 2, label: "Octal"),
                              DropdownMenuEntry(value: 3, label: "Hex")
                            ],
                            controller: _inputdrop,
                            onSelected: (value) {
                              _inputchange(value);
                            },
                            width: 150,
                            initialSelection: _current_input,
                            inputDecorationTheme: InputDecorationTheme(
                                filled: true, fillColor: Colors.white),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          DropdownMenu(
                            dropdownMenuEntries: [
                              DropdownMenuEntry(value: 0, label: "Binary"),
                              DropdownMenuEntry(value: 1, label: "Decimal"),
                              DropdownMenuEntry(value: 2, label: "Octal"),
                              DropdownMenuEntry(value: 3, label: "Hex")
                            ],
                            controller: _outputdrop,
                            onSelected: (value) {
                              _outputchange(value);
                            },
                            width: 150,
                            initialSelection: _current_output,
                            inputDecorationTheme: InputDecorationTheme(
                                fillColor: Colors.white, filled: true),
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
                            "${_getRadixString(_input_radix)} Number",
                            style: TextStyle(fontSize: 26),
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
                          SizedBox(
                            height: 50,
                            width: 350,
                            child: TextField(
                              controller: _inputtext,
                              onChanged: (value) {
                                input_value = value;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
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
                            width: 4,
                          ),
                          Container(
                              height: 50,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: _convert,
                                child: Row(children: [
                                  Icon(Icons.keyboard_arrow_down),
                                  Text(
                                    "Convert",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ]),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              width: 130,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: _clear,
                                  child: Row(
                                    children: [
                                      Icon(Icons.clear),
                                      Text("Reset",
                                          style: TextStyle(fontSize: 16))
                                    ],
                                  ))),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              height: 50,
                              width: 130,
                              child: ElevatedButton(
                                  onPressed: _swap,
                                  child: Row(
                                    children: [
                                      Icon(Icons.swap_horiz),
                                      Text("Swap",
                                          style: TextStyle(fontSize: 16))
                                    ],
                                  )))
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
                            "${_getRadixString(_output_radix)} Number",
                            style: TextStyle(fontSize: 26),
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
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: _outputtext,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabled: false),
                            ),
                          ),
                        ],
                      )
                    ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center)),
              ),
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(253, 247, 231, 10),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: "Convert"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Calculate")
        ],
        onTap: (value) {
          if(value==0){
            Navigator.pushNamed(context, "/Convert");
          }
          else
            {
              if(value==1)
                {
                  _outputtext.text=value.toString();
                  Navigator.pushNamed(context, "/Calculate");
                }
            }
        },
      ),
    );
  }
}

//enums

enum _radix { Binary, Decimal, Octal, Hex }
