import 'package:flutter/material.dart';

/// LAB SHEET 3 — SnackBar Message
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SnackBar Message',
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

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('SnackBar Example')),
    body: Center(child: ElevatedButton(
      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hello! Button pressed successfully.'))),
      child: const Text('Show Message'),
    )),
  );

}
