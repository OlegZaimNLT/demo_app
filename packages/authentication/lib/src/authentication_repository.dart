import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:authentication/src/firestore_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// ignore: depend_on_referenced_packages
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:meta/meta.dart';
import 'package:models/models.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirestoreProvider? firestoreProvider,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firestoreProvider = firestoreProvider ?? FirestoreProvider();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirestoreProvider _firestoreProvider;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  /// Only contains [User.id] and [User.mail],
  /// call [user] to get complete user information.
  Stream<User> get userStream {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  ///
  /// Only contains [User.id] and [User.mail],
  /// call [user] to get complete user information.
  User get currentUser {
    return _firebaseAuth.currentUser?.toUser ?? User.empty;
  }

  /// Returns the current authenticated user,
  /// with all its information.
  ///
  /// Defaults to [User.empty] is there is no cached user.
  Future<User> get user async {
    return _firestoreProvider.getUser(currentUser.id);
  }

  /// Creates a new user with the provided [user] info.
  ///
  /// Throws an [SignUpWithEmailAndPasswordFailure] if username
  /// is already in use or something happened while signing up.
  Future<void> signUp({required User user, required String password}) async {
    final usernameAlreadyInUse =
        await _firestoreProvider.verifyIfUsernameExists(user.username!);
    if (usernameAlreadyInUse) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(
        'username-already-in-use',
      );
    }

    try {
      final credential = await _signUpInFirebaseAuth(
        email: user.mail!,
        password: password,
      );

      await _firestoreProvider
          .createUser(user.copyWith(id: credential.user!.uid));
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Registers a new user with the provided [email], [password]
  /// inside Firebase Authentication service.
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> _signUpInFirebaseAuth({
    required String email,
    required String password,
  }) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [userStream] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, mail: email);
  }
}
