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
        child: ListView(
          padding: EdgeInsets.zero,
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
        Navigator.pop(context); // Close the drawer first

        // Avoid pushing same page again
        if (ModalRoute.of(context)?.settings.name != page.toString()) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => page,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 200),
            ),
          );
        }
      },
    );
  }
}