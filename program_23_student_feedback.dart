import 'package:flutter/material.dart';

/// LAB SHEET 3 — Student Feedback Form
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Student Feedback Form',
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

  final name = TextEditingController(), feedback = TextEditingController();
  int rating = 3;
  String result = '';
  @override
  void dispose() { name.dispose(); feedback.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student Feedback')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      TextField(controller: name, decoration: const InputDecoration(labelText: 'Student name')),
      const SizedBox(height: 12),
      const Text('Rating'),
      for (int i = 1; i <= 5; i++) RadioListTile<int>(title: Text('$i star${i == 1 ? "" : "s"}'), value: i, groupValue: rating, onChanged: (v) => setState(() => rating = v!)),
      TextField(controller: feedback, maxLines: 3, decoration: const InputDecoration(labelText: 'Your feedback', border: OutlineInputBorder())),
      ElevatedButton(onPressed: () => setState(() => result = name.text.isEmpty || feedback.text.isEmpty ? 'Please fill name and feedback' : 'Thank you, ${name.text}! Rating: $rating/5'), child: const Text('Submit')),
      Text(result),
    ]),
  );

}
