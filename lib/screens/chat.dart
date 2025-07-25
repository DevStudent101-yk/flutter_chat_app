import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      backgroundColor: const Color(0xFFD9D3CD), // soft background

      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          selectedUsername,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () async {
              try {
                final currentUser = FirebaseAuth.instance.currentUser;
                if (currentUser == null) return;

                final now = Timestamp.now();

                // save outgoing call
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(currentUser.uid)
                    .collection('calls')
                    .add({
                  'withUserId': selectedUserId,
                  'withUsername': selectedUsername,
                  'timestamp': now,
                  'type': 'outgoing',
                });

                // save incoming call
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(selectedUserId)
                    .collection('calls')
                    .add({
                  'withUserId': currentUser.uid,
                  'withUsername': currentUser.displayName ?? 'Unknown',
                  'timestamp': now,
                  'type': 'incoming',
                });

                // show confirmation
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: const Text('Calling...'),
                    content: Text('You are calling $selectedUsername'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } catch (error) {
                print('Call failed: $error');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to initiate call.')),
                );
              }
            },
          ),
        ],
      ),

      body: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white, // clean chat area
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ChatMessages(
                selectedUserId: selectedUserId,
                // you can style messages in ChatMessages widget itself
              ),
            ),
            const Divider(height: 1),
            NewMessage(
              selectedUserId: selectedUserId,
              // you can style text field & send button in NewMessage widget
            ),
          ],
        ),
      ),
    );
  }
}
