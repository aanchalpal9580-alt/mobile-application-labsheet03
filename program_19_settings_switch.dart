import 'package:flutter/material.dart';

/// LAB SHEET 3 — Settings Switch
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Settings Switch',
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

  bool enabled = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Settings Switch')),
    body: Center(child: SwitchListTile(title: const Text('Enable setting'), value: enabled, onChanged: (v) => setState(() => enabled = v), secondary: const Icon(Icons.settings))),
  );

}
