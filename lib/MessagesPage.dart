import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: const Color.fromARGB(255, 68, 193, 255),
      ),

      drawer: const AppDrawer(),

      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user1.jpg'),
            ),
            title: Text("James Red"),
            subtitle: Text("Brad, apas diri brad nag tagay mi"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user2.jpg'),
            ),
            title: Text("Daniel Fajardo"),
            subtitle: Text("Pre, na fall nako nimo pre"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user3.jpg'),
            ),
            title: Text("Marcos Revilla"),
            subtitle: Text("Bro, asa ta mag tagay karon?"),
          ),
        ],
      ),
    );
  }
}