import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocabulary/core/app_export.dart';

dismissKeyBoard() {
  try {
    FocusNode? primaryFocus = FocusManager.instance.primaryFocus;
    primaryFocus!.unfocus();
  } catch (e) {
    printMeLog(e.toString());
  }
}

final List<String> sources = [
  'TikTok',
  'Instagram',
  'Facebook',
  'App Store',
  'Web search',
  'Friend/family',
  'Other',
];

final List<String> ageGroups = [
  '13 to 17',
  '18 to 24',
  '25 to 34',
  '35 to 44',
  '45 to 54',
  '55+',
];
final List<String> genderOptions = [
  'Female',
  'Male',
  'Other',
  'Prefer not to say',
];

final List<String> learningTimes = [
  '1 minute a day',
  '3 minutes a day',
  '5 minutes a day',
];
final List<String> levels = [
  'Beginner',
  'Intermediate',
  'Advanced',
];
final List<String> themes = [
  Assets.assetsImagesTheme1,
  Assets.assetsImagesTheme2,
  Assets.assetsImagesTheme3,
  Assets.assetsImagesTheme4,
  Assets.assetsImagesTheme5,
  Assets.assetsImagesTheme6,
];

final List<String> goals = [
  'Enhance my lexicon',
  'Get ready for a test',
  'Improve my job prospects',
  'Enjoy learning new words',
  'Other',
];

List<String> topics = [
  'Society',
  'Words in foreign languages',
  'Human body',
  'Emotions',
  'Business',
  'Other',
];
List<String> daysOptions = ['3 days', '7 days', '21 days'];

List<Map<String, String>> wordDetails = [
  {
    'word': 'trepidation',
    'pronunciation': '/ˌtrepɪˈdeɪʃən/',
    'definition':
        '(n.) A feeling of fear or anxiety about something that may happen',
    'example':
        'She felt a sense of trepidation as she approached the dark, deserted alley.',
  },
  {
    'word': 'serendipity',
    'pronunciation': '/ˌsɛrənˈdɪpɪti/',
    'definition':
        '(n.) The occurrence of events by chance in a happy or beneficial way',
    'example': 'Finding that book in the old library was pure serendipity.',
  },
  {
    'word': 'ephemeral',
    'pronunciation': '/ɪˈfɛmərəl/',
    'definition': '(adj.) Lasting for a very short time',
    'example': 'The beauty of a sunset is often ephemeral.',
  },
  {
    'word': 'melancholy',
    'pronunciation': '/ˈmɛlənˌkɒli/',
    'definition': '(n.) A deep, pensive, and long-lasting sadness',
    'example':
        'She was filled with melancholy as she reminisced about her childhood.',
  },
  {
    'word': 'sonder',
    'pronunciation': '/ˈsɒndər/',
    'definition':
        '(n.) The realization that each passerby has a life as vivid and complex as your own',
    'example':
        'Walking through the crowded street, she felt a profound sense of sonder.',
  },
];
List fontFamilies = [
  GoogleFonts.roboto,
  GoogleFonts.lobster,
  GoogleFonts.pacifico,
  GoogleFonts.openSans,
  GoogleFonts.angkor,
  GoogleFonts.dancingScript,
];

TextStyle getTextThemeStyle(int index, double fontSize) {
  return fontFamilies[index % fontFamilies.length](
    textStyle: TextStyle(
      color: index < 2 ? ColorsManager.black : ColorsManager.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}
