import 'package:flutter/material.dart';
import 'intro_page3.dart';
import 'intro_page1.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 42, 41, 1),

      body: Column(
        children: [
          //first row
          Expanded(
            flex: 1, 
            child: Row(
            
           children: [
            Expanded(
              flex: 3,
             child: Container(
              color: Color(0xFFD9D3CD)
             ),
            ),
            //middle: no container just empty space
            Expanded(
              flex: 3,
              child: SizedBox(), //empty space
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
              )
            )
           ]
          ),
          ),
          //second row
          Expanded(
            flex: 7, 
            child: Column(
              children: [
                //inner row 1
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex:3,
                        child: SizedBox(),
                      ),
                      Expanded(
                      flex: 3,
                    child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                     child: Center(
                       child: SizedBox(
                        width: 400, // Set a max width so layout stays compact
                          child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
            // Rotated number
                         RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                              '01',
                         style: TextStyle(
                           fontSize: 28,
                        fontWeight: FontWeight.bold,
                    ),
                ),
              ),
               const SizedBox(width: 16),

            // Text
            Expanded(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: 'The login screen ensures '),
                    TextSpan(
                      text: 'secure access',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' for users with ease.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),
                      Expanded(
                        flex: 1,
                        child : SizedBox(),
                      )
                    ]
                  ),
                ),
                //inner row 2
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
    padding: const EdgeInsets.all(7),
    child: FittedBox(
      fit: BoxFit.scaleDown, // Shrinks content if needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Key Features',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Explore the essential components of\nour Flutter chat application.',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.normal,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ),
                      ),
                      
                      Expanded(
                      flex: 5,
                    child: Container(
                    color: Color(0xFFD9D3CD),
                     child: Center(
                       child: SizedBox(
                        width: 400, // Set a max width so layout stays compact
                          child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
            
               const SizedBox(width: 16),

            // Text
            Expanded(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: 'Chat lists allow for '),
                    TextSpan(
                      text: 'quick navigation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' between conversations with friends.'),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Rotated number
                         RotatedBox(
                          quarterTurns: -3,
                          child: Text(
                              '02',
                         style: TextStyle(
                           fontSize: 28,
                        fontWeight: FontWeight.bold,
                    ),
                ),
              ),

          ],
        ),
      ),
    ),
  ),
),

                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      )
                    ]
                  )
                ),
                //inner row 3
                
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                       Expanded(
                        flex: 1,
                       child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 39, 25, 10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, size: 60),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  IntroPage1(),
                            ),
                          );
                        },
                      ),
                    ),
                      ),
                      
                      Expanded(
                      flex: 3,
                    child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                     child: Center(
                       child: SizedBox(
                        width: 400, // Set a max width so layout stays compact
                          child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
            // Rotated number
                         RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                              '01',
                         style: TextStyle(
                           fontSize: 28,
                        fontWeight: FontWeight.bold,
                    ),
                ),
              ),
               const SizedBox(width: 16),

            // Text
            Expanded(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: 'User profiles enable '),
                    TextSpan(
                      text: 'personalization and customization,',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' enhancing user experience.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),
                      Expanded(
                        flex: 1,
                       child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 39, 25, 10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward, size: 60),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  IntroPage3(),
                            ),
                          );
                        },
                      ),
                    ),
                      )
                    ]
                  ),
                ),
                
                
              ]
            )
            
          ),
          // third row
          Expanded(
            flex: 1, 
            child: Row(
            
           children: [
            Expanded(
              flex: 3,
             child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
             ),
            ),
            //middle: no container just empty space
            Expanded(
              flex: 3,
              child: SizedBox(), //empty space
            ),
            Expanded(
              flex: 1,
              child: Container(
                
                color: Color(0xFFD9D3CD)
              )
            )
           ]
          ),
            
          ),
        ],
      ),
    );
  }
}
