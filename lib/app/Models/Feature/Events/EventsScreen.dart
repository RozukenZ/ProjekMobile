import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventScreen extends StatelessWidget {
  final CollectionReference eventsCollection =
  FirebaseFirestore.instance.collection('events');

  final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Event', style: TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: eventsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'Tidak ada event.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final events = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              final data = event.data() as Map<String, dynamic>;
              final likedBy = List<String>.from(data['likedBy'] ?? []);

              return Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data['title'] ?? 'Event',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Tambahkan logika refresh data jika diperlukan
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        data['date'] ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        data['time'] ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        data['description'] ?? '',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${data['likes'] ?? 0}',
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              icon: Icon(
                                likedBy.contains(userId)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: likedBy.contains(userId)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                              onPressed: () async {
                                if (likedBy.contains(userId)) {
                                  // Batalkan like
                                  final likes = data['likes'] ?? 0;
                                  await eventsCollection.doc(event.id).update({
                                    'likes': likes - 1,
                                    'likedBy': FieldValue.arrayRemove([userId]),
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Like dibatalkan untuk event ini.'),
                                    ),
                                  );
                                } else {
                                  // Tambahkan like
                                  final likes = data['likes'] ?? 0;
                                  await eventsCollection.doc(event.id).update({
                                    'likes': likes + 1,
                                    'likedBy': FieldValue.arrayUnion([userId]),
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
