import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:anvayarencang/app/Services/firebase_service.dart';

import '../../ChattingScreen/ChatScreen.dart';

class FriendListScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text('Daftar Teman'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Teman...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<String>>(
              stream: _firebaseService.getFriendsList(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final friendIds = snapshot.data!;
                return ListView.builder(
                  itemCount: friendIds.length,
                  itemBuilder: (context, index) {
                    final friendId = friendIds[index];
                    return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(friendId)
                          .get(),
                      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return ListTile(title: Text('Loading...'));
                        }

                        final friendData = snapshot.data!.data() as Map<String, dynamic>;
                        return FriendListItem(
                          name: friendData['email'],
                          onChatPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  friendId: friendId,
                                  friendEmail: friendData['email'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
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

class FriendListItem extends StatelessWidget {
  final String name;
  final VoidCallback onChatPressed;

  FriendListItem({required this.name, required this.onChatPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 16),
            ),
          ),
          ElevatedButton(
            onPressed: onChatPressed,
            child: Text('Chat'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}