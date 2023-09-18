import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  
  final color;
  final txtColor;
  final String btnText;
  final btnTapped;
  
  const CalcButton({Key? key, this.btnTapped, required this.color, required this.txtColor, required this.btnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                btnText,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}