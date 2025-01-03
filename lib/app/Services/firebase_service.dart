// firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/user_model.dart';
import '../Models/message_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<UserModel>> searchUsers(String query) async {
    final snapshot = await _firestore
        .collection('users')
        .where('email', isGreaterThanOrEqualTo: query)
        .where('email', isLessThan: query + 'z')
        .get();

    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return UserModel(
        uid: data['uid'],
        email: data['email'],
        friends: List<String>.from(data['friends'] ?? []),
      );
    }).toList();
  }

  Future<void> addFriend(String friendUid) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    await _firestore.collection('users').doc(currentUser.uid).update({
      'friends': FieldValue.arrayUnion([friendUid])
    });
  }

  Stream<List<String>> getFriendsList() {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return Stream.value([]);

    return _firestore
        .collection('users')
        .doc(currentUser.uid)
        .snapshots()
        .map((doc) => List<String>.from(doc.data()?['friends'] ?? []));
  }

  Future<void> sendMessage(String receiverId, String content) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    final chatId = _getChatId(currentUser.uid, receiverId);
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'senderId': currentUser.uid,
      'receiverId': receiverId,
      'content': content,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  Stream<List<MessageModel>> getMessages(String friendId) {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return Stream.value([]);

    final chatId = _getChatId(currentUser.uid, friendId);
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return MessageModel(
        senderId: data['senderId'],
        receiverId: data['receiverId'],
        content: data['content'],
        timestamp: DateTime.parse(data['timestamp']),
      );
    }).toList());
  }

  String _getChatId(String uid1, String uid2) {
    List<String> ids = [uid1, uid2];
    ids.sort();
    return ids.join('_');
  }
}