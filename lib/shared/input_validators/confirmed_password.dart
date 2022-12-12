import 'package:formz/formz.dart';

/// Validation errors for the [ConfirmedPassword] [FormzInput].
enum ConfirmedPasswordValidationError {
  /// Confirmed password and password don't mastch error.
  doesNotMatch,

  /// Confirmed password is empty error.
  empty
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class ConfirmedPasswordValidator
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  /// {@macro password}
  const ConfirmedPasswordValidator.pure()
      : _password = '',
        super.pure('');

  /// {@macro password}
  const ConfirmedPasswordValidator.dirty({
    required String password,
    required String value,
  })  : _password = password,
        super.dirty(value);

  final String _password;

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    if (value == null) return ConfirmedPasswordValidationError.empty;

    return _password == value
        ? null
        : ConfirmedPasswordValidationError.doesNotMatch;
  }
}
