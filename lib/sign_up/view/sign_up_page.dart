import 'package:authentication/authentication.dart';
import 'package:demo_app/app/app.dart';
import 'package:demo_app/l10n/l10n.dart';
import 'package:demo_app/shared/widgets/sign_in_options.dart';
import 'package:demo_app/sign_up/cubit/sign_up_cubit.dart';
import 'package:demo_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

part 'sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).textTheme.headline1,
        title: Text(
          AppLocalizations.of(context).sign_up,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocProvider<SignUpCubit>(
                    create: (_) =>
                        SignUpCubit(context.read<AuthenticationRepository>()),
                    child: const SignUpForm(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context).or,
                      style: AppTextStyle.subtitle2
                          .copyWith(color: AppColors.silver.shade500),
                    ),
                  ),
                  SignInOptionButtons(),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).already_have_an_account,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColors.silver.shade500,
                        ),
                      ),
                      _SignInButton(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('signUpForm_goToSignIn_flatButton'),
      onPressed: () => Navigator.of(context).pop(),
      child: Text(
        AppLocalizations.of(context).sign_in,
        style: AppTextStyle.textButtonUnderlined,
      ),
    );
  }
}
