import 'package:flutter/material.dart';

/// LAB SHEET 3 — Positive Negative or Zero
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Positive Negative or Zero',
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

  final number = TextEditingController();
  String result = '';
  @override
  void dispose() { number.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Number Checker')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: number, keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true), decoration: const InputDecoration(labelText: 'Enter a number')),
      ElevatedButton(onPressed: () { final n = double.tryParse(number.text); setState(() => result = n == null ? 'Enter a valid number' : n > 0 ? 'Positive number' : n < 0 ? 'Negative number' : 'Zero'); }, child: const Text('Check Number')),
      Text(result, style: const TextStyle(fontSize: 22)),
    ])),
  );

}
