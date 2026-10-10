import 'package:flutter/material.dart';

/// LAB SHEET 3 — Semester Dropdown
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Semester Dropdown',
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

  String semester = 'Semester 1';
  final semesters = List.generate(8, (i) => 'Semester ${i + 1}');
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Select Semester')),
    body: Center(child: Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisSize: MainAxisSize.min, children: [
      DropdownButton<String>(value: semester, items: semesters.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(), onChanged: (v) => setState(() => semester = v!)),
      Text('Selected: $semester'),
    ]))),
  );

}
