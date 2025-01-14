import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class RecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetWithButton(
      title: 'Tailor your word recommendations',
      subTitle: 'Answer a few questions to get personalized word suggestions',
      onTap: () {
        try {
          HapticFeedback.heavyImpact();
        } catch (_) {
          HapticFeedback.vibrate();
        }
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.ageSelection);
      },
      buttonText: 'Continue',
      image: Assets.assetsImages3,
    );
  }
}
