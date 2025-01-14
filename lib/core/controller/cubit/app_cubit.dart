// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../app_export.dart';

part 'app_state.dart';

AppCubit get appCubit => AppCubit.get(navigatorKey.currentContext!);

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int _selectedSourceValue = 9;

  int get selectedSourceValue => _selectedSourceValue;

  set selectedSourceValue(int value) {
    _selectedSourceValue = value;

    emit(SelectedSourceValueState());
  }

  int _selectedAgeValue = 9;

  int get selectedAgeValue => _selectedAgeValue;

  set selectedAgeValue(int value) {
    _selectedAgeValue = value;

    emit(SelectedAgeValueState());
  }

  int _selectedGenderValue = 9;

  int get selectedGenderValue => _selectedGenderValue;

  set selectedGenderValue(int value) {
    _selectedGenderValue = value;

    emit(SelectedGenderValueState());
  }

  int _selectedLearingTimeValue = 9;

  int get selectedLearingTimeValue => _selectedLearingTimeValue;

  set selectedLearingTimeValue(int value) {
    _selectedLearingTimeValue = value;

    emit(SelectedLearningTimeValueState());
  }

  int _selectedLevelValue = 9;

  int get selectedLevelValue => _selectedLevelValue;

  set selectedLevelValue(int value) {
    _selectedLevelValue = value;

    emit(SelectedLevelValueState());
  }

  int _selectedLearningDaysValue = 9;

  int get selectedLearningDaysValue => _selectedLearningDaysValue;

  set selectedLearningDaysValue(int value) {
    _selectedLearningDaysValue = value;

    emit(SelectedLearningDaysState());
  }

  int _selectedThemeIndex = 0;

  int get selectedThemeIndex => _selectedThemeIndex;

  set selectedThemeIndex(int value) {
    _selectedThemeIndex = value;

    emit(SelectedThemeValueState());
  }

  int _selectedGoalIndex = 9;

  int get selectedGoalIndex => _selectedGoalIndex;

  set selectedGoalIndex(int value) {
    _selectedGoalIndex = value;

    emit(SelectedGoalValueState());
  }

  List<String> selectedTopics = [];

  onChangeTopicSelection({required value, required topic}) {
    if (value == true) {
      selectedTopics.add(topic);
    } else {
      selectedTopics.remove(topic);
    }
    emit(OnChangeTopicSelectionState());
  }

  List<String> selectedGoals = [];

  onChangeGoalsSelection({required value, required goal}) {
    if (value == true) {
      selectedGoals.add(goal);
    } else {
      selectedGoals.remove(goal);
    }
    emit(OnChangeGoalSelectionState());
  }

  TextEditingController nameController = TextEditingController();
  PageController pageController = PageController();
  int currentPageIndex = 0;
  bool _isLottieVisible = true;

  bool get isLottieVisible => _isLottieVisible;

  set isLottieVisible(bool value) {
    _isLottieVisible = value;

    emit(ChangeLottieVisibiltyState());
  }

  sweipeUpFunction() {
    currentPageIndex++;
    pageController.animateToPage(
      currentPageIndex,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    emit(SwipeUpState());
  }
}
