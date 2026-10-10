import 'package:flutter/material.dart';

/// LAB SHEET 3 — Terms and Conditions Checkbox
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Terms and Conditions Checkbox',
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

  bool agreed = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Terms and Conditions')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      CheckboxListTile(title: const Text('I agree to the terms and conditions'), value: agreed, onChanged: (v) => setState(() => agreed = v ?? false)),
      Text(agreed ? 'You have agreed.' : 'Please agree to continue.'),
    ])),
  );

}
