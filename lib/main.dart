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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  bool isAnimating = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // ❌ REMOVE AUTO START
    // _controller.forward();
  }

  void _toggleAnimation() {
    if (isAnimating) {
      _controller.stop();
    } else {
      _controller.forward();
    }

    setState(() {
      isAnimating = !isAnimating;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 68, 193, 255),
      ),
      drawer: const AppDrawer(),

      body: GestureDetector(
        onTap: _toggleAnimation, // 👈 click here

        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1 - _animation.value),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  "Homepage",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 11, 0, 125),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}