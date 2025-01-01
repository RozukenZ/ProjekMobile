import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteLocationsScreen extends StatelessWidget {
  final CollectionReference locationsCollection =
  FirebaseFirestore.instance.collection('locations');
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Lokasi Favorit'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: locationsCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'Tidak ada lokasi favorit.',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                final locations = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    final location = locations[index];
                    final data = location.data() as Map<String, dynamic>;
                    final likedBy = List<String>.from(data['likedBy'] ?? []);

                    return LocationListItem(
                      name: data['name'] ?? 'Lokasi',
                      address: data['address'] ?? 'Alamat tidak tersedia',
                      isLiked: likedBy.contains(userId),
                      likesCount: data['likes'] ?? 0,
                      onLike: () async {
                        if (likedBy.contains(userId)) {
                          // Batalkan like
                          await locationsCollection.doc(location.id).update({
                            'likes': FieldValue.increment(-1),
                            'likedBy': FieldValue.arrayRemove([userId]),
                          });
                        } else {
                          // Tambahkan like
                          await locationsCollection.doc(location.id).update({
                            'likes': FieldValue.increment(1),
                            'likedBy': FieldValue.arrayUnion([userId]),
                          });
                        }
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

class LocationListItem extends StatelessWidget {
  final String name;
  final String address;
  final bool isLiked;
  final int likesCount;
  final VoidCallback onLike;

  LocationListItem({
    required this.name,
    required this.address,
    required this.isLiked,
    required this.likesCount,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  address,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '$likesCount',
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                ),
                onPressed: onLike,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
