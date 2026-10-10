import 'package:flutter/material.dart';

/// LAB SHEET 3 — Department Dropdown
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Department Dropdown',
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

  String department = 'Computer Science';
  final departments = ['Computer Science', 'Information Technology', 'Management', 'Mathematics'];
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Select Department')),
    body: Center(child: Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisSize: MainAxisSize.min, children: [
      DropdownButton<String>(value: department, items: departments.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(), onChanged: (v) => setState(() => department = v!)),
      Text('Selected: $department'),
    ]))),
  );

}
