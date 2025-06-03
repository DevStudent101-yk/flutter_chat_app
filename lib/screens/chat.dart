import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String selectedUserId;
  final String selectedUsername;
  
  const ChatScreen({
    super.key,
    required this.selectedUserId,
    required this.selectedUsername,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(selectedUserId: selectedUserId), 
          ),
          NewMessage(selectedUserId: selectedUserId), 
        ],
      ),
    );
  }
}
