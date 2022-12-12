import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');
  const PasswordValidator.dirty({String value = ''}) : super.dirty(value);

  static final _passwordRegExp = RegExp(
    r'^[A-Za-z\d@$!%*?&]{8,}$',
  );

  @override
  PasswordValidationError? validator(String value) {
    if (pure) {
      return null;
    }
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else {
      return _passwordRegExp.hasMatch(value) ? null : PasswordValidationError.invalid;
    }
  }
}

extension Explanation on PasswordValidationError {
  String? get name {
    switch (this) {
      case PasswordValidationError.invalid:
        return 'Invalid condition';
      case PasswordValidationError.empty:
        return 'This field can\'t be empty';
    }
  }
}