import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';
import 'package:vocabulary/presentation/widgets/widget_with_checkBox.dart';

class GoalSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetWithCheckBox(
      title: 'Do you have a specific goal in mind?',
      subTitle: 'Select at least one option to continue',
      goalScreen: true,
      listToShow: goals,
      selectedList: appCubit.selectedGoals,
      routeName: AppRoutes.topicSelectionScreen,
    );
  }
}
