import 'package:flutter/material.dart';

/// LAB SHEET 3 — Student Result Application
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Student Result Application',
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
    appBar: AppBar(title: const Text('Student Result')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      TextField(controller: name, decoration: const InputDecoration(labelText: 'Student name')),
      for (int i = 0; i < 3; i++) TextField(controller: marks[i], keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Subject ${i + 1} marks (out of 100)')),
      ElevatedButton(onPressed: () {
        final v = marks.map((c) => double.tryParse(c.text)).toList();
        if (name.text.trim().isEmpty || v.any((x) => x == null || x < 0 || x > 100)) {
          setState(() => result = 'Enter a name and valid marks (0–100).');
          return;
        }
        final total = v.fold<double>(0, (sum, x) => sum + x!);
        final percentage = total / 3;
        final pass = v.every((x) => x! >= 33);
        setState(() => result = 'Student: ${name.text}\\nTotal: ${total.toStringAsFixed(0)}/300\\nPercentage: ${percentage.toStringAsFixed(2)}%\\nResult: ${pass ? "PASS" : "FAIL"}');
      }, child: const Text('Calculate Result')),
      const SizedBox(height: 12),
      Text(result, style: const TextStyle(fontSize: 20)),
    ]),
  );

}
