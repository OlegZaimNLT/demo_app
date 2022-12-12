/// {@template sign_up_with_email_and_password_failure}
/// Thrown if during the sign up process if a failure occurs.
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'Ha ocurrido un error inesperado :(',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'El correo es inválido o tiene un formato incorrecto.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'Este usuario ha sido deshabilitado. Contacta a soporte por ayuda.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'El correo ya está en uso con otra cuenta.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operación no permitida. Por favor contacta a soporte.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Por favor ingresa una contraseña más segura.',
        );
      case 'username-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'El nombre de usuario ya está en uso, intenta con otro.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'Ha ocurrido un error inesperado :(',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'El correo es inválido o tiene un formato incorrecto.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'Este usuario ha sido deshabilitado. Contacta a soporte por ayuda.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Usuario no registrado, verifica tu correo o nombre de usuario.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Contraseña incorrecta, inténtalo otra vez.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}
