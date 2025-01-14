import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'package:vocabulary/presentation/pages/age_selection.dart';
import 'package:vocabulary/presentation/pages/gender_selection.dart';
import 'package:vocabulary/presentation/pages/goal_selection.dart';
import 'package:vocabulary/presentation/pages/home_screen.dart';
import 'package:vocabulary/presentation/pages/learning_days.dart';
import 'package:vocabulary/presentation/pages/learning_time_screen.dart';
import 'package:vocabulary/presentation/pages/make_voca.dart';
import 'package:vocabulary/presentation/pages/name_screen.dart';
import 'package:vocabulary/presentation/pages/recommandtion_screen.dart';
import 'package:vocabulary/presentation/pages/setup_vocab.dart';
import 'package:vocabulary/presentation/pages/source_selection.dart';
import 'package:vocabulary/presentation/pages/theme_selection.dart';
import 'package:vocabulary/presentation/pages/topic_Selection.dart';
import 'package:vocabulary/presentation/pages/vocab_level.dart';
import 'package:vocabulary/presentation/pages/welcome_screen.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String sourceSelection = '/sourceSelection';
  static const String recommendationScreen = '/recommendationScreen';
  static const String ageSelection = '/ageSelection';
  static const String genderSelection = '/genderSelection';
  static const String nameScreen = '/nameScreen';
  static const String makeVocaScreen = '/makeVocaScreen';
  static const String learningTimeScreen = '/learningTimeScreen';
  static const String vocabularyLevelScreen = '/vocabularyLevelScreen';
  static const String themeSelectionScreen = '/themeSelectionScreen';
  static const String setupVocabularyScreen = '/setupVocabularyScreen';
  static const String goalSelectionScreen = '/goalSelectionScreen';
  static const String topicSelectionScreen = '/topicSelectionScreen';
  static const String learningDaysScreen = '/learningDaysScreen';
  static const String homeScreen = '/homeScreen';

  static Map<String, WidgetBuilder> get routes {
    return {
      initialRoute: (context) => OnboardingScreen(),
      sourceSelection: (context) => FadeAnimatedWidget(child: SourceSelectionScreen()),
      recommendationScreen: (context) => RecommendationScreen(),
      ageSelection: (context) => AgeSelectionScreen(),
      genderSelection: (context) => GenderSelectionScreen(),
      nameScreen: (context) => NameSelectionScreen(),
      makeVocaScreen: (context) => MakeVocabularyYoursScreen(),
      learningTimeScreen: (context) => LearningTimeScreen(),
      vocabularyLevelScreen: (context) => VocabularyLevelScreen(),
      themeSelectionScreen: (context) => ThemeSelectionScreen(),
      setupVocabularyScreen: (context) => SetupVocabularyScreen(),
      goalSelectionScreen: (context) => GoalSelectionScreen(),
      topicSelectionScreen: (context) => TopicSelectionScreen(),
      learningDaysScreen: (context) => LearningDaysScreen(),
      homeScreen: (context) => HomeScreen(),
    };
  }
}
