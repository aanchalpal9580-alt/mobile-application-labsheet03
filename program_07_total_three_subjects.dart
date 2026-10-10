import 'package:flutter/material.dart';

/// LAB SHEET 3 — Student Total Marks
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Student Total Marks',
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
  final marks = List.generate(3, (_) => TextEditingController());
  String result = '';
  @override
  void dispose() { name.dispose(); for (final c in marks) { c.dispose(); } super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Total Marks')),
    body: Padding(padding: const EdgeInsets.all(20), child: ListView(children: [
      TextField(controller: name, decoration: const InputDecoration(labelText: 'Student name')),
      for (int i = 0; i < 3; i++) TextField(controller: marks[i], keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Subject ${i + 1} marks')),
      ElevatedButton(onPressed: () { final values = marks.map((c) => double.tryParse(c.text)).toList(); setState(() => result = values.any((v) => v == null) ? 'Enter valid marks' : 'Name: ${name.text}\nTotal = ${values.fold<double>(0, (sum, v) => sum + v!)}'); }, child: const Text('Calculate Total')),
      Text(result, style: const TextStyle(fontSize: 20)),
    ])),
  );

}
