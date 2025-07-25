import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  final String selectedUserId;
  const NewMessage({super.key,  required this.selectedUserId});

  @override
  State<NewMessage> createState() {
    
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
  final enteredMessage = _messageController.text;

  if (enteredMessage.trim().isEmpty) {
    return;
  }

  FocusScope.of(context).unfocus();
  _messageController.clear();

  final user = FirebaseAuth.instance.currentUser;

  if (user == null) return;

  final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

  final userData = userDoc.data();

  if (userData == null || !userData.containsKey('username')) {
    print('User data not found or missing username field.');
    return;
  }

  FirebaseFirestore.instance.collection('chat').add({
    'text': enteredMessage,
    'createdAt': Timestamp.now(),
    'userId': user.uid,
    'username': userData['username'],
    //'userImage': userData['image_url'] ?? '',
    'recipientId': widget.selectedUserId,
    'participants': [user.uid, widget.selectedUserId],
  });
}


 @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8E1DA), // light warm background
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF63533F)), // warm accent
            onPressed: _submitMessage,
          ),
        ],
      ),
    ),
  );
}

}