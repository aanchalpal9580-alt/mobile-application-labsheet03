import 'package:flutter/material.dart';

/// LAB SHEET 3 — Area of Rectangle
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Area of Rectangle',
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

  final length = TextEditingController(), width = TextEditingController();
  String result = '';
  @override
  void dispose() { length.dispose(); width.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Rectangle Area')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: length, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Length')),
      TextField(controller: width, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Width')),
      ElevatedButton(onPressed: () { final l = double.tryParse(length.text), w = double.tryParse(width.text); setState(() => result = l == null || w == null || l < 0 || w < 0 ? 'Enter valid positive dimensions' : 'Area = ${l * w} square units'); }, child: const Text('Calculate Area')),
      Text(result, style: const TextStyle(fontSize: 20)),
    ])),
  );

}
