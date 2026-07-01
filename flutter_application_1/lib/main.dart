import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen6',
      home: const Screen6(),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Text(
                'BingeFlix',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 4,
              width: 140,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F1FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'BingeFlix',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const SizedBox.expand(),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F1FA),
      body: const Center(
        child: Text(
          'BingeFlix',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF008080),
      child: const SafeArea(
        child: Center(
          child: Text(
            'BingeFlix',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF008080),
      child: SafeArea(
        child: Center(
          child: Text(
            'BingeFlix',
            style: GoogleFonts.bebasNeue(
              color: Colors.black,
              fontSize: 80,
            ),
          ),
        ),
      ),
    );
  }
}

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'BINGEWORTHY TV SHOWS',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF008080),
      body: Center(
        child: Text(
          'BINGEFLIX',
          style: GoogleFonts.bebasNeue(
            color: Colors.black,
            fontSize: 80,
          ),
        ),
      ),
    );
  }
}
