import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:chat_app/screens/splash.dart';
// ignore: unused_import
import 'package:chat_app/screens/chat.dart';
import 'firebase_options.dart';
import 'package:chat_app/screens/auth.dart';
import 'package:chat_app/screens/user_list_screen.dart';
import 'package:chat_app/screens/intro_pages/intro_page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          key: ValueKey(snapshot.data?.uid), // ✅ Triggers rebuild on auth change
          title: 'FlutterChat',
          theme: ThemeData().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 17, 177),
            ),
          ),
          home: _buildHome(snapshot),
        );
      },
    );
  }

  Widget _buildHome(AsyncSnapshot<User?> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const SplashScreen(); // ⏳ still loading
    }

    if (snapshot.hasData) {
      return const UserListScreen(); // ✅ user logged in
    }

    return const IntroPage1(); // 🚪 user not logged in
  }
}
