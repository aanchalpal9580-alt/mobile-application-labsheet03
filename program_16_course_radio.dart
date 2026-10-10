import 'package:flutter/material.dart';

/// LAB SHEET 3 — Course Radio Buttons
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Course Radio Buttons',
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

  String course = 'BCA';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Select Course')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      for (final c in ['BCA', 'BBA', 'B.Sc']) RadioListTile<String>(title: Text(c), value: c, groupValue: course, onChanged: (v) => setState(() => course = v!)),
      Text('Selected course: $course'),
    ])),
  );

}
