import 'package:flutter/material.dart';
import 'AppDrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 68, 193, 255),
      ),

      drawer: const AppDrawer(),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            "Homepage Content",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 11, 0, 125),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}