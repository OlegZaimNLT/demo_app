import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';

class FirestoreProvider {
  FirestoreProvider({
    FirebaseFirestore? firebaseFirestore,
  }) : _firestore = firebaseFirestore ?? FirebaseFirestore.instance {
    _users = _firestore.collection('user');
  }

  final FirebaseFirestore _firestore;
  late final CollectionReference _users;

  Future<void> createUser(User user) async {
    return _users.doc(user.id).set({
      'name': user.name,
      'mail': user.mail,
      'username': user.username,
      'birthdate': user.birthdate?.microsecondsSinceEpoch,
      'genre': user.genre,
    });
  }

  Future<bool> verifyIfUsernameExists(String username) async {
    final coincidences = await _users
        .where(
          'username',
          isEqualTo: username,
        )
        .get();
    return coincidences.size > 0;
  }

  Future<User> getUser(String id) async {
    if (id.isEmpty) return User.empty;

    final doc = await _users.doc(id).get();
    final data = doc.data() as Map<String, dynamic>?;
    return User(
      id: doc.id,
      name: data?['name'] as String,
      mail: data?['mail'] as String,
      username: data?['username'] as String,
      genre: data?['genre'] as String,
      birthdate: DateTime.fromMicrosecondsSinceEpoch(data?['birthdate'] as int),
    );
  }
}
