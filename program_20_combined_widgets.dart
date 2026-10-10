import 'package:flutter/material.dart';

/// LAB SHEET 3 — Checkbox Radio Dropdown Switch
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Checkbox Radio Dropdown Switch',
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

  bool agreed = false, notifications = true;
  String gender = 'Female', course = 'BCA';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Combined Widgets')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      CheckboxListTile(title: const Text('Agree to terms'), value: agreed, onChanged: (v) => setState(() => agreed = v ?? false)),
      const Text('Gender'),
      for (final g in ['Female', 'Male', 'Other']) RadioListTile<String>(title: Text(g), value: g, groupValue: gender, onChanged: (v) => setState(() => gender = v!)),
      const Text('Course'),
      DropdownButton<String>(value: course, items: ['BCA', 'BBA', 'B.Sc'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(), onChanged: (v) => setState(() => course = v!)),
      SwitchListTile(title: const Text('Notifications'), value: notifications, onChanged: (v) => setState(() => notifications = v)),
      Text('Terms: ${agreed ? "Agreed" : "Not agreed"}\\nGender: $gender\\nCourse: $course\\nNotifications: ${notifications ? "ON" : "OFF"}'),
    ]),
  );

}
