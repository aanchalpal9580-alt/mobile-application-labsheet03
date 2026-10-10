import 'package:flutter/material.dart';

/// LAB SHEET 3 — BMI Calculator
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BMI Calculator',
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

  final height = TextEditingController(), weight = TextEditingController();
  String result = '';
  @override
  void dispose() { height.dispose(); weight.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('BMI Calculator')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: height, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Height in metres (e.g. 1.65)')),
      TextField(controller: weight, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Weight in kilograms')),
      ElevatedButton(onPressed: () { final h = double.tryParse(height.text), w = double.tryParse(weight.text); setState(() => result = h == null || w == null || h <= 0 || w <= 0 ? 'Enter valid height and weight' : 'BMI = ${(w / (h * h)).toStringAsFixed(2)}'); }, child: const Text('Calculate BMI')),
      Text(result, style: const TextStyle(fontSize: 20)),
    ])),
  );

}
