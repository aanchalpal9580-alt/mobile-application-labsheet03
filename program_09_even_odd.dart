import 'package:flutter/material.dart';

/// LAB SHEET 3 — Even or Odd
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Even or Odd',
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
    appBar: AppBar(title: const Text('Even or Odd')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: number, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Enter an integer')),
      ElevatedButton(onPressed: () { final n = int.tryParse(number.text); setState(() => result = n == null ? 'Enter a valid integer' : n.isEven ? '$n is Even' : '$n is Odd'); }, child: const Text('Check')),
      Text(result, style: const TextStyle(fontSize: 22)),
    ])),
  );

}
