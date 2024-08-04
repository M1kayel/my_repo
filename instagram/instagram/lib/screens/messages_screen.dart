import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Number of conversations
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/user${index % 3 + 1}.jpg'), // Placeholder user images
                  ),
                  title: Text(
                    'User ${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'This is a preview of the message...',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    // Navigate to chat details page
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}