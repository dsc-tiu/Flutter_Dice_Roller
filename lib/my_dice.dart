import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_dice_roller/dice_button.dart';

class MyDice extends StatefulWidget {
  @override
  _MyDiceState createState() => _MyDiceState();
}

class _MyDiceState extends State<MyDice> {
  String imagePath = 'assets/dice_6.jpeg';

  void rollDice() {
    setState(() {
      var randomNumber = Random().nextInt(6) + 1;
      print(randomNumber);
      imagePath = 'assets/dice_${randomNumber}.jpeg'
      print(imagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Dice Roller'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        elevation: 8,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 70.0,
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: MediaQuery.of(context).size.width / 2 - 90,
            child: InkWell(
              onTap: rollDice,
              child: DiceButton(),
            ),
          )
        ],
      ),
    );
  }
}
