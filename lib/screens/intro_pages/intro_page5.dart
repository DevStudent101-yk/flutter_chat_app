import 'package:flutter/material.dart';
import 'package:chat_app/screens/auth.dart';

class IntroPage5 extends StatelessWidget {
  const IntroPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side
          Expanded(
  flex: 2,
  child: AspectRatio(
    aspectRatio: 1, // Match your image's aspect ratio (adjust if needed)
    child: Container(
      color: const Color.fromARGB(255, 125, 121, 121),
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          // ✅ Background image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/images/login_background.webp',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // ✅ Login box with fixed ratio alignment
          Align(
            alignment: const FractionalOffset(0.52, 0.33), // adjust finely
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const AuthScreen()),
                );
              },
              
              child: FractionallySizedBox(
                widthFactor: 0.36,
                heightFactor: 0.08,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    //borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
// right size
Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children:[
                      Expanded(
                        flex: 7,
                        child: Container(color: const Color.fromARGB(238, 0, 0, 0),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: const Color.fromARGB(255, 94, 82, 69),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children:[
                      Expanded(
                        flex: 7,
                        child: Container(color: const Color.fromARGB(255, 255, 254, 254),
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'User-Friendly\n Entry Point',
                                style: TextStyle(
                                  fontSize: 28,
                                  //fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                             // SizedBox(height: 10),
                              
                            ],
                          ),
                      ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: const Color.fromARGB(238, 0, 0, 0),),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Row(
                    children:[
                      Expanded(
                        flex: 7,
                        child: Container(color: const Color.fromARGB(238, 0, 0, 0),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container( color: const Color.fromARGB(255, 125, 121, 121),),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),

        ],
      ),
    );
  }
}
