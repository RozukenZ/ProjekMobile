import 'package:anvayarencang/app/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:anvayarencang/app/Services/firebase_service.dart';

class FindFriendsScreen extends StatefulWidget {
  @override
  _FindFriendsScreenState createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();
  List<UserModel> _searchResults = [];

  void _searchUsers(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }
    final results = await _firebaseService.searchUsers(query);
    setState(() => _searchResults = results);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text('Cari Teman', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchUsers,
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
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final user = _searchResults[index];
                return _buildFriendSuggestion(user.email, user.uid);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendSuggestion(String name, String uid) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[700],
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(name, style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton(
              child: Text('Tambah'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => _firebaseService.addFriend(uid),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}