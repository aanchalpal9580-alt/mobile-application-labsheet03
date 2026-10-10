import 'package:flutter/material.dart';

/// LAB SHEET 3 — Registration Form UI
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Registration Form UI',
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

  final name = TextEditingController(), email = TextEditingController(), password = TextEditingController();
  String gender = 'Female', course = 'BCA', result = '';
  @override
  void dispose() { name.dispose(); email.dispose(); password.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Registration Form')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      TextField(controller: name, decoration: const InputDecoration(labelText: 'Full name')),
      TextField(controller: email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Email')),
      TextField(controller: password, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
      const SizedBox(height: 10),
      const Text('Gender'),
      for (final g in ['Female', 'Male', 'Other']) RadioListTile<String>(title: Text(g), value: g, groupValue: gender, onChanged: (v) => setState(() => gender = v!)),
      const Text('Course'),
      DropdownButton<String>(value: course, items: ['BCA', 'BBA', 'B.Sc'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(), onChanged: (v) => setState(() => course = v!)),
      ElevatedButton(onPressed: () => setState(() => result = name.text.isEmpty || email.text.isEmpty || password.text.isEmpty ? 'Please fill all fields' : 'Registration submitted for ${name.text}'), child: const Text('Register')),
      Text(result),
    ]),
  );

}
