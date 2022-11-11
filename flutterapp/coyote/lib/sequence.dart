import 'package:flutter/material.dart';


class Sequence extends StatefulWidget {
  const Sequence({super.key});

  @override
  State<Sequence> createState() => _SequenceState();
}

class _SequenceState extends State<Sequence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(209, 27, 26, 26),
      body: Column(
        children: [
          Text('Welcome to sequence page' , style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}