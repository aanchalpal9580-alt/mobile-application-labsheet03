import 'package:flutter/material.dart';

/// LAB SHEET 3 — Gender Radio Buttons
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Gender Radio Buttons',
    theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String gender = 'Female';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Select Gender')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      RadioListTile<String>(title: const Text('Female'), value: 'Female', groupValue: gender, onChanged: (v) => setState(() => gender = v!)),
      RadioListTile<String>(title: const Text('Male'), value: 'Male', groupValue: gender, onChanged: (v) => setState(() => gender = v!)),
      RadioListTile<String>(title: const Text('Other'), value: 'Other', groupValue: gender, onChanged: (v) => setState(() => gender = v!)),
      Text('Selected gender: $gender'),
    ])),
  );

}
