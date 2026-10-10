import 'package:flutter/material.dart';

/// LAB SHEET 3 — Login Form UI
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Login Form UI',
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

  final username = TextEditingController(), password = TextEditingController();
  String result = '';
  void reset() { username.clear(); password.clear(); setState(() => result = ''); }
  @override
  void dispose() { username.dispose(); password.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Login Form')),
    body: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: Column(children: [
      const Icon(Icons.lock_outline, size: 60),
      TextField(controller: username, decoration: const InputDecoration(labelText: 'Username', prefixIcon: Icon(Icons.person))),
      TextField(controller: password, obscureText: true, decoration: const InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock))),
      const SizedBox(height: 16),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: () => setState(() => result = username.text.isEmpty || password.text.isEmpty ? 'Please enter username and password' : 'Login form submitted'), child: const Text('Login')),
        const SizedBox(width: 12),
        OutlinedButton(onPressed: reset, child: const Text('Reset')),
      ]),
      Text(result),
    ]))),
  );

}
