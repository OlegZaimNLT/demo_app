import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.name,
    this.mail,
    this.username,
    this.genre,
    this.birthdate,
  });

  final String id;
  final String? name;
  final String? mail;
  final String? username;
  final String? genre;
  final DateTime? birthdate;

  @override
  List<Object?> get props => [id, name, mail, username, genre, birthdate];

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the user is not empty.
  bool get isNotEmpty => this != User.empty;

  User copyWith({
    String? id,
    String? name,
    String? mail,
    String? username,
    String? genre,
    DateTime? birthdate,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      mail: mail ?? this.mail,
      username: username ?? this.username,
      genre: genre ?? this.genre,
      birthdate: birthdate ?? this.birthdate,
    );
  }
}
