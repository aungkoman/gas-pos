import 'package:flutter/material.dart';
import 'package:gaspos/pages/branch/branch_list_page.dart';
import 'package:gaspos/pages/business/business_list_page.dart';
import 'package:gaspos/providers/branch_provider.dart';
import 'package:gaspos/providers/business_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // 1. Initialize any bindings or plugins here (e.g., Firebase, Hive)
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Run the app
  // runApp(const MyApp());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BusinessProvider>(
          create: (context) => BusinessProvider(),
        ),
        ChangeNotifierProvider<BranchProvider>(
          create: (context) => BranchProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Business"),
            trailing: Icon(Icons.arrow_forward_ios),

            onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BusinessListPage(),
              ),
            );
          },),

          ListTile(

            leading: Icon(Icons.cabin_sharp),
            title: Text("Branch"),

            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BranchListPage(),
              ),
            );
          },)
        ],
      )
    );
  }
}