import 'package:flutter/material.dart';
import 'package:tesworkshop/main.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.getResult, required this.calculateBMI});
  final String getResult;
  final String calculateBMI;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "YOUR RESULT",
              style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.getResult,
              style: TextStyle(color: Colors.green, fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.calculateBMI,
              style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("BACK"))
        ],
      ),
    );
  }
}
