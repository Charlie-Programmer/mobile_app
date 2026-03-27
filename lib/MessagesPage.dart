import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final int _itemCount = 3; // number of list items
  List<bool> _visible = [];

  @override
  void initState() {
    super.initState();

    _visible = List.generate(_itemCount, (_) => false);

    _staggerAnimation();
  }

  void _staggerAnimation() async {
    for (int i = 0; i < _itemCount; i++) {
      await Future.delayed(Duration(milliseconds: 300)); // stagger delay
      if (mounted) {
        setState(() {
          _visible[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> messages = [
      {
        'image': 'assets/user1.jpg',
        'title': 'James Red',
        'subtitle': 'Brad, apas diri brad nag tagay mi',
      },
      {
        'image': 'assets/user2.jpg',
        'title': 'Daniel Fajardo',
        'subtitle': 'Pre, na fall nako nimo pre',
      },
      {
        'image': 'assets/user3.jpg',
        'title': 'Marcos Revilla',
        'subtitle': 'Bro, asa ta mag tagay karon?',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: const Color.fromARGB(255, 68, 193, 255),
      ),
      drawer: const AppDrawer(),

      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return AnimatedOpacity(
            opacity: _visible[index] ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(messages[index]['image']!),
              ),
              title: Text(messages[index]['title']!),
              subtitle: Text(messages[index]['subtitle']!),
            ),
          );
        },
      ),
    );
  }
}