import 'package:flutter/material.dart';
import 'intro_page5.dart';

class IntroPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //row 1 for empty space and image
          Expanded(
            flex: 3,
            child: Row(
              children: [
                //in left empty space
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 14,
                  child: Container(
                    color: const Color.fromARGB(236, 36, 35, 35),
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color.fromARGB(236, 36, 35, 35),
                            width: 1,
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/screen_2x.webp',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //the row 2
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: const Color.fromARGB(209, 57, 37, 12),
                    padding: const EdgeInsets.all(7),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Engaging Conversations',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Enhanced User Experience for Chat interactions',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
          //row 3
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(flex: 1, child: SizedBox()),

                Expanded(
                  flex: 12,
                  child: Container(
                    color: const Color.fromARGB(255, 187, 183, 176),
                    padding: const EdgeInsets.all(7),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'This screen features interactive elements designed for seamless communication, allowing users to send messages, share media, and interact effortlessly with their contacts.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(179, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      //borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, size: 60),
                      color: const Color.fromARGB(255, 187, 183, 176),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IntroPage5()),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
          //row 4
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.black)),
                Expanded(flex: 7, child: SizedBox()),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color.fromARGB(255, 187, 183, 176),
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
