import 'package:flutter/material.dart';

/// LAB SHEET 3 — Change Text Button
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Change Text Button',
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

  String message = 'Press the button';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Change Text')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(message, style: const TextStyle(fontSize: 22)),
      ElevatedButton(onPressed: () => setState(() => message = 'Button was pressed!'), child: const Text('Change Text')),
    ])),
  );

}
