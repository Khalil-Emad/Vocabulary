import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class SourceSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WdgetWithRadio(
        title: 'How did you hear about Vocabulary?',
        subTitle: 'Select an option to continue',
        listToShow: sources,
        groupValue: appCubit.selectedSourceValue,
        onChange: (value) async {
          try {
            HapticFeedback.heavyImpact();
          } catch (_) {
            HapticFeedback.vibrate();
          }
          appCubit.selectedSourceValue = value!;
          await Future.delayed(Duration(milliseconds: 500));
          NavigatorService.pushNamedAndRemoveUntil(
              AppRoutes.recommendationScreen);
        });
  }
}
