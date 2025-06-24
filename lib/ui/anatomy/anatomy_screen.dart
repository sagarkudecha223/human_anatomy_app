import 'package:flutter/material.dart';

class AnatomyScreen extends StatefulWidget {
  const AnatomyScreen({super.key});

  @override
  State<AnatomyScreen> createState() => _AnatomyScreenState();
}

class _AnatomyScreenState extends State<AnatomyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('anatomy screen')),
    );
  }
}
