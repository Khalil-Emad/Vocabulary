import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class AgeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WdgetWithRadio(
        title: 'How old are you?',
        subTitle: 'Your age is used to personalize your content',
        listToShow: ageGroups,
        groupValue: appCubit.selectedAgeValue,
        onChange: (value) async {
          try {
            HapticFeedback.heavyImpact();
          } catch (_) {
            HapticFeedback.vibrate();
          }
          appCubit.selectedAgeValue = value!;
          await Future.delayed(Duration(milliseconds: 500));
          NavigatorService.pushNamedAndRemoveUntil(AppRoutes.genderSelection);
        });
  }
}
