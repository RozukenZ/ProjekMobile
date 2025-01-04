import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';

class ChatScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;

  const ChatScreen({
    Key? key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _generateChatRoomId() {
    String currentUserID = _firebaseAuth.currentUser!.uid;
    return currentUserID.hashCode <= widget.receiverUserID.hashCode
        ? '${currentUserID}_${widget.receiverUserID}'
        : '${widget.receiverUserID}_${currentUserID}';
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    await _firestore
        .collection('chat_rooms')
        .doc(_generateChatRoomId())
        .collection('messages')
        .add({
      'senderId': _firebaseAuth.currentUser!.uid,
      'senderEmail': _firebaseAuth.currentUser!.email,
      'receiverId': widget.receiverUserID,
      'message': _messageController.text.trim(),
      'timestamp': FieldValue.serverTimestamp(),
      'isRead': false,
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  HomeScreen()),
            );
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('MG'),
            ),
            const SizedBox(width: 10),
            Text(widget.receiverUserEmail),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chat_rooms')
                  .doc(_generateChatRoomId())
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error loading messages'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView(
                  padding: const EdgeInsets.all(8),
                  children: snapshot.data!.docs.map((doc) {
                    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                    bool isUser = data['senderId'] == _firebaseAuth.currentUser!.uid;

                    return ChatBubble(
                      message: data['message'],
                      isUser: isUser,
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey[900],
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Handle camera functionality
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Tulis pesan...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    // Handle voice message functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? Colors.purple : Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}