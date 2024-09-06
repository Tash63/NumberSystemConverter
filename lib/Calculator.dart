import 'package:flutter/material.dart';

class Calcultor extends StatefulWidget {
  @override
  State<Calcultor> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calcultor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz), label: "Convert"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "Calculate")
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.pushNamed(context, "/Convert");
            } else {
              if (value == 1) {
                Navigator.pushNamed(context, "/Calculate");
              }
            }
          },
          backgroundColor: Color.fromRGBO(253, 247, 231, 10)),
      appBar: AppBar(
        title: Text("Rapid Tables Clone"),
        backgroundColor: Color.fromRGBO(253, 247, 231, 10),
      ),
      backgroundColor: Colors.lime,
      body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backgroundImage.jpg"),
                  fit: BoxFit.cover))),
    );
  }
}
