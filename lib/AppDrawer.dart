import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'main.dart';
import 'MessagesPage.dart';
import 'SettingsPage.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 68, 193, 255),
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Avatar + Name
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Charlie",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Divider(
              color: Colors.black54,
              indent: 40,
              endIndent: 40,
            ),

            const SizedBox(height: 10),

            // Menu Items
            _item(context, Icons.home, "Home", const HomePage()),
            _item(context, Icons.person, "Profile", const ProfilePage()),
            _item(context, Icons.message, "Messages", const MessagesPage()),
            _item(context, Icons.settings, "Settings", const SettingsPage()),
          ],
        ),
      ),
    );
  }

  // Drawer item
  Widget _item(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // close drawer first
        Future.delayed(const Duration(milliseconds: 100), () { // slightly faster delay
          Navigator.of(context).pushReplacement(_popupRoute(page));
        });
      },
    );
  }

  // Smooth popup animation (fade + scale) — faster
  Route _popupRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 250), // faster
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var fade = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        );
        var scale = Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        );

        return FadeTransition(
          opacity: fade,
          child: ScaleTransition(
            scale: scale,
            child: child,
          ),
        );
      },
    );
  }
}