import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetWithButton(
      showSizedBox: false,
      title: 'Expand your Vocabulary in 1 minute a day',
      subTitle:
          'Learn 10,000+ new words this year with a new daily habit that takes just 1 minute',
      onTap: () async {
        try {
          HapticFeedback.heavyImpact();
        } catch (_) {
          HapticFeedback.vibrate();
        }

        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.sourceSelection);
      },
      buttonText: 'Get Started',
      image: Assets.assetsImages1,
    );
  }
}
