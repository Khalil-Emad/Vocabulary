import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class SetupVocabularyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetWithButton(
      title: 'Set up Vocabulary to get\npersonalized words',
      subTitle:
          'Some final questions to customize Vocabulary to what you want to achieve',
      onTap: () async {
        try {
          HapticFeedback.heavyImpact();
        } catch (_) {
          HapticFeedback.vibrate();
        }
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.goalSelectionScreen);
      },
      buttonText: 'Continue',
      image: Assets.assetsImages13,
    );
  }
}
