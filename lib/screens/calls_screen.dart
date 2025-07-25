import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F2EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5A4D3B),
        elevation: 2,
        title: const Text(
          'Call History',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentUserId)
              .collection('calls')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final callDocs = snapshot.data!.docs;

            if (callDocs.isEmpty) {
              return const Center(
                child: Text(
                  'No calls yet.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }

            return ListView.separated(
              itemCount: callDocs.length,
              separatorBuilder: (_, __) => const Divider(height: 12),
              itemBuilder: (ctx, index) {
                final call = callDocs[index];
                final username = call['withUsername'];
                final type = call['type'];
                final timestamp = (call['timestamp'] as Timestamp).toDate();

                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: const Color(0xFFF8F6F2),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 16),
                  leading: CircleAvatar(
                    backgroundColor:
                        type == 'incoming' ? Colors.green : Colors.blue,
                    child: Icon(
                      type == 'incoming'
                          ? Icons.call_received
                          : Icons.call_made,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${timestamp.toLocal()}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
