import 'package:flutter/material.dart';

/// LAB SHEET 3 — Simple Calculator
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Calculator',
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

  final a = TextEditingController(), b = TextEditingController();
  String result = '';
  void calculate(String op) {
    final x = double.tryParse(a.text), y = double.tryParse(b.text);
    if (x == null || y == null) { setState(() => result = 'Enter valid numbers'); return; }
    if (op == '/' && y == 0) { setState(() => result = 'Cannot divide by zero'); return; }
    final value = switch (op) { '+' => x + y, '-' => x - y, '*' => x * y, '/' => x / y, _ => 0.0 };
    setState(() => result = 'Result = $value');
  }
  @override
  void dispose() { a.dispose(); b.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Arithmetic Operations')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: a, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'First number')),
      TextField(controller: b, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Second number')),
      Wrap(spacing: 8, children: ['+', '-', '*', '/'].map((op) => ElevatedButton(onPressed: () => calculate(op), child: Text(op))).toList()),
      Text(result, style: const TextStyle(fontSize: 20)),
    ])),
  );

}
