import 'package:flutter/material.dart';

/// LAB SHEET 3 — Sum of Two Numbers
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Sum of Two Numbers',
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
  @override
  void dispose() { a.dispose(); b.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Sum of Two Numbers')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: a, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'First number')),
      TextField(controller: b, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Second number')),
      ElevatedButton(onPressed: () { final x = double.tryParse(a.text); final y = double.tryParse(b.text); setState(() => result = x == null || y == null ? 'Enter valid numbers' : 'Sum = ${x + y}'); }, child: const Text('Calculate Sum')),
      Text(result, style: const TextStyle(fontSize: 20)),
    ])),
  );

}
