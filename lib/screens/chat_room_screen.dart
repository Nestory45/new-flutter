import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  final List<String> chatRooms = ['General', 'Flutter', 'Firebase', 'Random'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Rooms')),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chatRooms[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to ChatScreen with room name
              Navigator.pushNamed(
                context,
                '/chat',
                arguments: chatRooms[index],
              );
            },
          );
        },
      ),
    );
  }
}
