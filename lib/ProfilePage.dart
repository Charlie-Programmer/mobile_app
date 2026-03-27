import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  bool _isBig = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _onAvatarTap() {
    if (_isBig) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isBig = !_isBig;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 🔷 Top curved header
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 230,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 68, 193, 255),
                      Color.fromARGB(255, 68, 193, 255),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                ),
              ),

              // 🔷 Menu button
              Positioned(
                top: 40,
                left: 10,
                child: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),

              // 🔷 Name + Avatar
              Column(
                children: [
                  const SizedBox(height: 60),

                  const Text(
                    "Charlie Pagapong",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ✅ Animated Avatar on Click
                  GestureDetector(
                    onTap: _onAvatarTap,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 🔷 Profile fields
          Expanded(
            child: ListView(
              children: [
                _buildItem(Icons.person_outline, "Charlie"),
                _buildItem(Icons.cake_outlined, "Oct 11, 2004"),
                _buildItem(Icons.phone_android, "0963 123 456"),
                _buildItem(Icons.camera_alt_outlined, "Charlie Pagapong"),
                _buildItem(Icons.email_outlined, "charliepagapong@gmail.com"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔧 Reusable list item
  Widget _buildItem(IconData icon, String text, {Widget? trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 68, 193, 255)),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}