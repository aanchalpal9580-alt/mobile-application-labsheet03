import 'package:flutter/material.dart';

/// LAB SHEET 3 — Student Name
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Student Name',
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

  final name = TextEditingController();
  String displayed = '';
  @override
  void dispose() { name.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student Name')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        TextField(controller: name, decoration: const InputDecoration(labelText: 'Enter student name', border: OutlineInputBorder())),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: () => setState(() => displayed = name.text.trim()), child: const Text('Display Name')),
        Text('Student Name: $displayed', style: const TextStyle(fontSize: 20)),
      ]),
    ),
  );

}
