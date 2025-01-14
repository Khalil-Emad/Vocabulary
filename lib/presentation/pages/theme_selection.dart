import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class ThemeSelectionScreen extends StatefulWidget {
  @override
  _ThemeSelectionScreenState createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.v,
            ),
            Text(
              'Which theme would you like to start with?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Choose from a larger selection of themes or create your own later',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsManager.white),
            ),
            SizedBox(height: 70.v),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemCount: themes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      appCubit.selectedThemeIndex = index;
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 500.v,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(themes[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Abcd",
                            style: getTextThemeStyle(index, 20),
                          ),
                        ),
                        if (appCubit.selectedThemeIndex == index)
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    size: 25,
                                    color: ColorsManager.buttonColor,
                                  ),
                                ],
                              )),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: CustomButton(
                  text: 'Continue',
                  onTap: () {
                    try {
                      HapticFeedback.heavyImpact();
                    } catch (_) {
                      HapticFeedback.vibrate();
                    }
                    NavigatorService.pushNamedAndRemoveUntil(
                        AppRoutes.setupVocabularyScreen);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
