import 'package:flutter/material.dart';

/// LAB SHEET 3 — Percentage of Three Subjects
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Percentage of Three Subjects',
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

  final marks = List.generate(3, (_) => TextEditingController());
  String result = '';
  @override
  void dispose() { for (final c in marks) { c.dispose(); } super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Percentage Calculator')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      for (int i = 0; i < 3; i++) TextField(controller: marks[i], keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Subject ${i + 1} marks (out of 100)')),
      ElevatedButton(onPressed: () { final v = marks.map((c) => double.tryParse(c.text)).toList(); setState(() => result = v.any((x) => x == null || x < 0 || x > 100) ? 'Enter marks from 0 to 100' : 'Percentage = ${(v.fold<double>(0, (s, x) => s + x!) / 3).toStringAsFixed(2)}%'); }, child: const Text('Calculate Percentage')),
      Text(result, style: const TextStyle(fontSize: 20)),
    ])),
  );

}
