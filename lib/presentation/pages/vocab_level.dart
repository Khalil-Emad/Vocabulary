import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class VocabularyLevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WdgetWithRadio(
        title: "What's your vocabulary level?",
        subTitle: 'Select an option to continue',
        listToShow: levels,
        groupValue: appCubit.selectedLevelValue,
        onChange: (value) async {
          try {
            HapticFeedback.heavyImpact();
          } catch (_) {
            HapticFeedback.vibrate();
          }
          appCubit.selectedLevelValue = value!;
          await Future.delayed(Duration(milliseconds: 500));
          NavigatorService.pushNamedAndRemoveUntil(
              AppRoutes.themeSelectionScreen);
        });
  }
}
