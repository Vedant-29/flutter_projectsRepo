import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// underscore means its a private class - to only be used for this stateful widget.
class _DiceRollerState extends State<DiceRoller> {
  // var activeDiceImage = 'assets/images/dice-1.png'; 
  var currentDiceRoll = 2;

  void rolldice() {
    currentDiceRoll = Random().nextInt(6) + 1;
    setState(() {
    });
  }

  @override
  Widget build(cotnext) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dice-$currentDiceRoll.png'
              , width: 200
            ),
            TextButton(
                onPressed: rolldice,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 20,),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 28
                    ),
                ),
                child: const Text("Roll dice")),
          ],
        );
  }
}