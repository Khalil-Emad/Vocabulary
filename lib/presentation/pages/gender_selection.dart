import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class GenderSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WdgetWithRadio(
        title: 'Which option represents you best?',
        subTitle: 'Select an option to continue',
        listToShow: genderOptions,
        groupValue: appCubit.selectedGenderValue,
        onChange: (value) async {
          try {
            HapticFeedback.heavyImpact();
          } catch (_) {
            HapticFeedback.vibrate();
          }
          appCubit.selectedGenderValue = value!;
          await Future.delayed(Duration(milliseconds: 500));
          NavigatorService.pushNamedAndRemoveUntil(AppRoutes.nameScreen);
        });
  }
}
