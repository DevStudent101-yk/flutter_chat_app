import 'package:flutter/material.dart';
import 'intro_page2.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFD9D3CD),
      body: Column(
        children: [
          // Top Row (3 sections)
          Expanded(
            flex: 1,
            child: Row(
              children: [
                // Left
                Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                // Middle
                Expanded(flex: 8, child: Container()),
                // Right
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color.fromARGB(204, 99, 83, 63),
                  ),
                ),
              ],
            ),
          ),

          // Middle Row (Text + Image)
Expanded(
  flex: 4,
  child: Row(
    children: [
      // Left: Text
      Expanded(
        flex: 4,
        child: Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(16),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Flutter Chat\nApplication',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),

      // Right image
      Expanded(
        flex: 4,
        child: Container(
           padding: const EdgeInsets.all(10),
          color: Colors.black87,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/images/chat_mockup.webp',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    ],
  ),
),


          Expanded(
  flex: 2,
  child: Row(
    children: [
      
      Expanded(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: const Text.rich(
            TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: 'Discover the features and user interface of a ',
                ),
                TextSpan(
                  text: 'modern communication tool',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' designed for seamless interaction and connectivity.',
                ),
              ],
            ),
          ),
        ),
      ),

      // Arrow Button - Fixed width
      Container(
        width: 60,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 131, 118, 102), 
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_forward, size: 40, color: Colors.white),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IntroPage2()),
            );
          },
        ),
      ),
    ],
  ),
),



          // Bottom Strip Row
          Expanded(
            flex: 1,
            child: Row(
              children: [
                // Left
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color.fromARGB(204, 99, 83, 63),
                  ),
                ),
                // Middle
                Expanded(flex: 6, child: Container()),
                // Right
                Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
