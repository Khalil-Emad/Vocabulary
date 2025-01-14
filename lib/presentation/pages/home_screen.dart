import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocabulary/core/app_export.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(themes[appCubit.selectedThemeIndex]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsManager.inputColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          width: 150.h,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5.v,
                                  ),
                                  Text(
                                    "0/5",
                                    style:
                                        TextStyle(color: ColorsManager.white),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: LinearProgressIndicator(
                                        value: 0,
                                        backgroundColor: Colors.grey,
                                        color: ColorsManager.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorsManager.inputColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.emoji_events_outlined,
                                color: ColorsManager.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: appCubit.pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: wordDetails.length,
                    itemBuilder: (context, index) {
                      final word = wordDetails[index];
                      Color selectedColor = appCubit.selectedThemeIndex < 2
                          ? ColorsManager.black
                          : ColorsManager.white;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(word['word']!,
                              style: fontFamilies[appCubit.selectedThemeIndex](
                                textStyle: TextStyle(
                                  fontSize: 32,
                                  color: selectedColor,
                                ),
                              )),
                          Text(word['pronunciation']!,
                              style: fontFamilies[appCubit.selectedThemeIndex](
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: selectedColor,
                                ),
                              )),
                          SizedBox(height: 20),
                          Text(word['definition']!,
                              textAlign: TextAlign.center,
                              style: fontFamilies[appCubit.selectedThemeIndex](
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: selectedColor,
                                ),
                              )),
                          SizedBox(height: 10),
                          Text(word['example']!,
                              textAlign: TextAlign.center,
                              style: fontFamilies[appCubit.selectedThemeIndex](
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: selectedColor,
                                ),
                              )),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Lottie Animation
          if (appCubit.isLottieVisible)
            Center(
              child: GestureDetector(
                onTap: () {
                  appCubit.isLottieVisible = false;
                },
                onVerticalDragEnd: (details) {
                  appCubit.isLottieVisible = false;
                  if (appCubit.currentPageIndex < wordDetails.length - 1) {
                    appCubit.sweipeUpFunction();
                  }
                },
                child: Lottie.asset(
                  Assets.assetsImagesSwipeUp,
                  width: 600.h,
                  height: 600.v,
                  delegates: LottieDelegates(
                    values: [
                      ValueDelegate.color(
                        const ['**'],
                        value: ColorsManager.buttonColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
