part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final EmailValidator email;
  final PasswordValidator password;
  final FormzStatus status;
  final String? errorMessage;

  SignInState copyWith({
    EmailValidator? email,
    PasswordValidator? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}