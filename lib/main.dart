// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tesworkshop/bmi_controller.dart';
import 'package:tesworkshop/result.dart';

class MyColors {
  static const bgColor = Color(0xFF0A0E21);
  static const cardColor = Color(0xFF1D1E33);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // double height = 180.0;
  // double weight = 40.0;
  // int age = 20;
  // bool ontapFemale = false;
  // bool ontapMale = false;
  bool ontapFemale = false;
  bool ontapMale = false;
  double height = 180;
  double weight = 40;
  int age = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BMI CALCULATOR'),
      // ),
      body: Container(
        color: MyColors.bgColor,
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        ontapFemale = false;
                        ontapMale = true;
                      });
                    },
                    child: ReusableCard(
                        color: ontapMale == true ? Colors.blue : MyColors.cardColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 80,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "MALE",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        ontapFemale = true;
                        ontapMale = false;
                      });
                    },
                    child: ReusableCard(
                        color: ontapFemale == true ? Colors.pink : MyColors.cardColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 80,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "FEMALE",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        )),
                  ),
                )
              ],
            )),
            Expanded(
                child: ReusableCard(
                    color: MyColors.cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          height.toStringAsFixed(0),
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Slider(
                            value: height,
                            min: 120,
                            max: 220,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            })
                      ],
                    ))),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      color: MyColors.cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            weight.toStringAsFixed(0),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(
                            width: 300,
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReuseIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onpressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                ReuseIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onpressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      color: MyColors.cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(
                            width: 300,
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReuseIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onpressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                ReuseIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onpressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            )),
            InkWell(
              onTap: () {
                BMIcalculator calc = BMIcalculator(weight: weight, height: height);
                if (weight != 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                calculateBMI: calc.calculateBMI(),
                                getResult: calc.getResult(),
                              )));
                } else if (weight <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Weight harus lebih besar dari 0"),
                    ),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.color, required this.child});
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}

class ReuseIconButton extends StatelessWidget {
  const ReuseIconButton({super.key, required this.icon, required this.onpressed});

  final IconData icon;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
