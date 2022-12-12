import 'package:demo_app/app/bloc/app_bloc.dart';
import 'package:demo_app/l10n/l10n.dart';
import 'package:demo_app/theme/app_colors.dart';
import 'package:demo_app/theme/app_text_style.dart';
import 'package:demo_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:models/models.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.asset(
                          'assets/image/avatar_image.png',
                        ).image,
                        radius: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(user.mail ?? "",
                            style: AppTextStyle.headline1
                                .copyWith(color: AppColors.silver.shade900)),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "New York",
                                style: AppTextStyle.body,
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: AppColors.silver.shade300,
                                  shape: BoxShape.circle),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "ID: 1234124",
                                style: AppTextStyle.body,
                              ),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context).edit,
                          style: AppTextStyle.textButtonUnderlined,
                        ),
                      ),
                      _ProfileButtons(),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                _UserDetails(
                  user: user,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: OutlinedButton(
              key: const Key('signInForm_facebook_textButton'),
              onPressed: () {},
              style: AppTheme.outlinedSecondaryButton,
              child: Text(
                AppLocalizations.of(context).about_me,
                style: AppTextStyle.headline3.copyWith(color: AppColors.silver),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: OutlinedButton(
              key: const Key('signInForm_linkedin_textButton'),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              style: AppTheme.outlinedPrimaryButton,
              child: Text(AppLocalizations.of(context).log_out),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserDetails extends StatelessWidget {
  final User user;

  const _UserDetails({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.silver.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          _buildCardWidget(context, Icons.phone,
              AppLocalizations.of(context).phone_number, '+3788888888'),
          _buildCardWidget(context, Icons.mail,
              AppLocalizations.of(context).email, '${user.mail}'),
          _buildCardWidget(context, Icons.circle,
              AppLocalizations.of(context).completed_projects, '245'),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildCardWidget(
      BuildContext context, IconData icon, String label, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.silver.shade50, width: 0.5)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: AppColors.pinkAccent,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    width: 0.5,
                    height: 40,
                    color: AppColors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: AppTextStyle.body
                            .copyWith(color: AppColors.silver.shade50)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        content,
                        style:
                            AppTextStyle.body.copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
