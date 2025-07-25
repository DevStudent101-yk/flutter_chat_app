import 'package:flutter/material.dart';
void showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text("Filter Chats"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.circle),
              title: Text("Online Only"),
              onTap: () {
                Navigator.pop(context);
                // apply your filter logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Unread Messages"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favorites"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
