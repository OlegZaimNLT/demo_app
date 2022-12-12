part of 'sign_up_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.confirmedPassword = const ConfirmedPasswordValidator.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final EmailValidator email;
  final PasswordValidator password;
  final ConfirmedPasswordValidator confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [
    email,
    password,
    confirmedPassword,
    status,
  ];

  SignUpState copyWith({
    EmailValidator? email,
    PasswordValidator? password,
    ConfirmedPasswordValidator? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
