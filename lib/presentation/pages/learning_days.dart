import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class LearningDaysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WdgetWithRadio(
        showSkip: true,
        title: 'How many days in a row will you learn words?',
        subTitle:
            'Commit to building a learning habit by coming back every day',
        listToShow: daysOptions,
        groupValue: appCubit.selectedLearningDaysValue,
        onChange: (value) async {
          try {
            HapticFeedback.heavyImpact();
          } catch (_) {
            HapticFeedback.vibrate();
          }
          appCubit.selectedLearningDaysValue = value!;
          await Future.delayed(Duration(milliseconds: 500));
          NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
        });
  }
}
