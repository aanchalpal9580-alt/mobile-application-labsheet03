import 'package:flutter/material.dart';

/// LAB SHEET 3 — Celsius to Fahrenheit
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Celsius to Fahrenheit',
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

  final celsius = TextEditingController();
  String result = '';
  @override
  void dispose() { celsius.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Temperature Converter')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: celsius, keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true), decoration: const InputDecoration(labelText: 'Temperature in Celsius')),
      ElevatedButton(onPressed: () { final c = double.tryParse(celsius.text); setState(() => result = c == null ? 'Enter a valid temperature' : 'Fahrenheit = ${(c * 9 / 5 + 32).toStringAsFixed(2)} °F'); }, child: const Text('Convert')),
      Text(result, style: const TextStyle(fontSize: 20)),
    ])),
  );

}
