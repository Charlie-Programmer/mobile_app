import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color.fromARGB(255, 68, 193, 255),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          _buildSettingsTile(
            context,
            icon: Icons.lock,
            title: "Privacy",
            heroTag: "privacyTile",
          ),
          _buildSettingsTile(
            context,
            icon: Icons.notifications,
            title: "Notifications",
            heroTag: "notificationsTile",
          ),
          _buildSettingsTile(
            context,
            icon: Icons.palette,
            title: "Appearance",
            heroTag: "appearanceTile",
          ),
          _buildSettingsTile(
            context,
            icon: Icons.info,
            title: "About",
            heroTag: "aboutTile",
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String heroTag,
  }) {
    return ListTile(
      leading: Hero(
        tag: heroTag,
        child: Material(
          color: Colors.transparent,
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
      ),
      title: Hero(
        tag: "$heroTag-title",
        child: Material(
          color: Colors.transparent,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SettingsDetailPage(
              title: title,
              icon: icon,
              heroTag: heroTag,
            ),
          ),
        );
      },
    );
  }
}

class SettingsDetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String heroTag;

  const SettingsDetailPage({
    super.key,
    required this.title,
    required this.icon,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: const Color.fromARGB(255, 68, 193, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: heroTag,
              child: Icon(icon, size: 100, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Hero(
              tag: "$heroTag-title",
              child: Material(
                color: Colors.transparent,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "HERO DEMO ANIMATION.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}