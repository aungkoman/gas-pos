import 'package:flutter/material.dart';

void main() {
  // 1. Initialize any bindings or plugins here (e.g., Firebase, Hive)
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Run the app
  runApp(const MyApp());
}

// The Root Widget: Handles global app configuration
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false, // Removes the debug banner

      // Global Theme Configuration (Material 3)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // The first screen your app loads
      home: const HomePage(),
    );
  }
}

// Your First Screen: Keeps UI logic separate from app config
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Welcome to your new app!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add action
          debugPrint('Button pressed!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}