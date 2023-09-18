import 'package:flutter/material.dart';
import 'package:calculator/Home/buttons_box.dart';
import 'package:calculator/methods/isoperator.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalc extends StatefulWidget {
  const MyCalc({super.key});

  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {

  var userQuestion = "";
  var userAnswer = "";

  final List<String> buttons = [
    "C" , "DEL" , "%", "/",
    "9" , "8" , "7", "X",
    "6" , "5" , "4", "-",
    "3" , "2" , "1", "+",
    "0" , "." , "ANS", "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 50,),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                  itemBuilder: (BuildContext context, int index) {
                    // Clear button
                    if (index == 0) {
                      return CalcButton(
                        btnTapped: () {
                          setState(() {
                            userQuestion = "";
                            userAnswer = "";
                          });
                        },
                        btnText: buttons[index],
                        color: Colors.green,
                        txtColor: Colors.white
                    );
                    } 
                    // Delete button
                    else if (index == 1) {
                      return CalcButton(
                        btnTapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(0, userQuestion.length - 1);
                          });
                        },  
                        btnText: buttons[index],
                        color: Colors.red,
                        txtColor: Colors.white,
                    );
                    } 
                    // Equal to button
                    else if (index == buttons.length - 1) {
                      return CalcButton(
                        btnTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },  
                        btnText: buttons[index],
                        color: Colors.deepPurple,
                        txtColor: Colors.white,
                    );
                    } 
                    // Rest of the buttons
                    else {
                      return CalcButton(
                        btnTapped: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        btnText: buttons[index],
                        color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurple[50],
                        txtColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,
                    );
                    }
                  },
                )
              ),
            )
          ],
        ),
      ),  
    );
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("X", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();

    
  }

}