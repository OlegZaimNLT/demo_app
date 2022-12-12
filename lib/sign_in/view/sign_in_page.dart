import 'package:authentication/authentication.dart';
import 'package:demo_app/l10n/l10n.dart';
import 'package:demo_app/sign_in/sign_in.dart';
import 'package:demo_app/sign_up/sign_up.dart';
import 'package:demo_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../shared/widgets/sign_in_options.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

part 'sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SignInPage());

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignInPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).sign_in,
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
                  Image.asset(
                    'assets/image/sign_in_image.png',
                    height: 150,
                  ),
                  //todo check what the problem with that svg image
                  // SvgPicture.asset(
                  //   'assets/image/sign_in_image.svg',
                  //   height: 200,
                  // ),
                  const SizedBox(height: 64),
                  BlocProvider(
                    create: (_) =>
                        SignInCubit(context.read<AuthenticationRepository>()),
                    child: const SignInForm(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context).or,
                      style: AppTextStyle.subtitle2
                          .copyWith(color: AppColors.silver),
                    ),
                  ),
                  SignInOptionButtons(),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).dont_have_an_account,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColors.silver,
                        ),
                      ),
                      _SignUpButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        key: const Key('signInForm_createAccount_flatButton'),
        onPressed: () {
          Navigator.of(context).push<void>(SignUpPage.route());
        },
        child: Text(
          AppLocalizations.of(context).sign_up,
          style: AppTextStyle.textButtonUnderlined,
        ),
      ),
    );
  }
}
