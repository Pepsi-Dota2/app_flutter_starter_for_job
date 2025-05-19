import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Chat> chatList = [
      Chat(
          name: "John Doe",
          lastMessage: "Hey, how's it going?",
          avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
          time: "10:30 AM"),
      Chat(
          name: "Jane Smith",
          lastMessage: "Are you free this weekend?",
          avatarUrl: "https://randomuser.me/api/portraits/women/2.jpg",
          time: "09:45 AM"),
      Chat(
          name: "Michael Brown",
          lastMessage: "Let's catch up soon!",
          avatarUrl: "https://randomuser.me/api/portraits/men/3.jpg",
          time: "08:00 AM"),
      // Add more sample data as needed
    ];
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button on the top
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric( vertical: 15, horizontal: 20),
                    filled: true,
                    fillColor: Colors.grey.shade100, 
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.grey), 
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {},
                ),
              )
            ],
          ),

          const SizedBox(height: 20),
          // Display chat list
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat.avatarUrl),
                  ),
                  title: Text(chat.name),
                  subtitle: Text(chat.lastMessage),
                  trailing: Text(chat.time,
                      style: const TextStyle(color: Colors.grey)),
                  onTap: () {
                  },
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class Chat {
  final String name;
  final String lastMessage;
  final String avatarUrl;
  final String time;

  Chat(
      {required this.name,
      required this.lastMessage,
      required this.avatarUrl,
      required this.time});
}
