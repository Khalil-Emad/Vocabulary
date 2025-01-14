import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class MakeVocabularyYoursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetWithButton(
      title:
          "Let's make Vocabulary yours ${appCubit.nameController.text != "" ? "," : ""} ${appCubit.nameController.text}",
      subTitle: 'Customize the app to make the most of your experience',
      onTap: () {
        try {
          HapticFeedback.heavyImpact();
        } catch (_) {
          HapticFeedback.vibrate();
        }
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.learningTimeScreen);
      },
      buttonText: 'Continue',
      image: Assets.assetsImages7,
    );
  }
}
