import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';
import 'package:vocabulary/presentation/widgets/widget_with_checkBox.dart';

class TopicSelectionScreen extends StatefulWidget {
  @override
  _TopicSelectionScreenState createState() => _TopicSelectionScreenState();
}

class _TopicSelectionScreenState extends State<TopicSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetWithCheckBox(
      title: 'Which topics are you interested in?',
      subTitle: 'Select at least one to continue',
      goalScreen: false,
      listToShow: topics,
      selectedList: appCubit.selectedTopics,
      routeName: AppRoutes.learningDaysScreen,
    );
  }
}
