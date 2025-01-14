import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class LearningTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WdgetWithRadio(
        title: 'How much time will you devote to learning?',
        subTitle: 'You can always change your goal later',
        listToShow: learningTimes,
        groupValue: appCubit.selectedLearingTimeValue,
        onChange: (value) async {
          try {
            HapticFeedback.heavyImpact();
          } catch (_) {
            HapticFeedback.vibrate();
          }
          appCubit.selectedLearingTimeValue = value!;
          await Future.delayed(Duration(milliseconds: 500));
          NavigatorService.pushNamedAndRemoveUntil(
              AppRoutes.vocabularyLevelScreen);
        });
  }
}
