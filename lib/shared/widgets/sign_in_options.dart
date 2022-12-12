import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_theme.dart';

class SignInOptionButtons extends StatelessWidget {
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
              onPressed: () {
              },
              style: AppTheme.secondaryButton,
              child: SvgPicture.asset(
                'assets/icons/facebook.svg',
                height: 15,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: OutlinedButton(
              key: const Key('signInForm_twitter_textButton'),
              onPressed: () {
              },
              style: AppTheme.secondaryButton,
              child: SvgPicture.asset(
                'assets/icons/twitter.svg',
                height: 15,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: OutlinedButton(
              key: const Key('signInForm_linkedin_textButton'),
              onPressed: () {
              },
              style: AppTheme.secondaryButton,
              child: SvgPicture.asset(
                'assets/icons/linkedin.svg',
                height: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
