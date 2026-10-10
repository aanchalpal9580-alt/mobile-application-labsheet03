import 'package:flutter/material.dart';

/// LAB SHEET 3 — Submit and Reset Form
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Submit and Reset Form',
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

  final name = TextEditingController(), email = TextEditingController();
  String result = '';
  void reset() { name.clear(); email.clear(); setState(() => result = ''); }
  @override
  void dispose() { name.dispose(); email.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Simple Form')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: name, decoration: const InputDecoration(labelText: 'Name')),
      TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
      Row(children: [
        ElevatedButton(onPressed: () => setState(() => result = 'Submitted: ${name.text} (${email.text})'), child: const Text('Submit')),
        const SizedBox(width: 10),
        OutlinedButton(onPressed: reset, child: const Text('Reset')),
      ]),
      Text(result),
    ])),
  );

}
