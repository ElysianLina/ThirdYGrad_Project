import 'package:flutter/material.dart';

class PharmaScreen extends StatefulWidget {
  const PharmaScreen({super.key});

  @override
  State<PharmaScreen> createState() => _PharmaScreenState();
}

class _PharmaScreenState extends State<PharmaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("PHARMACIST"),
    );
  }
}
