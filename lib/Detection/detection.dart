import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detectionpage extends StatefulWidget {
  const detectionpage({super.key});

  @override
  State<detectionpage> createState() => _detectionpageState();
}

class _detectionpageState extends State<detectionpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Lets detect"),
      ),
    );
  }
}