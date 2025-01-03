class UserModel {
  final String uid;
  final String email;
  List<String> friends;

  UserModel({
    required this.uid,
    required this.email,
    this.friends = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'friends': friends,
    };
  }
}
