import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class NameSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.v,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    appCubit.nameController.clear();
                    NavigatorService.pushNamedAndRemoveUntil(
                        AppRoutes.makeVocaScreen);
                  },
                  child: Text("Skip",
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorsManager.white,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(
              height: 20.v,
            ),
            Text(
              textAlign: TextAlign.center,
              'What do you want to be called?',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              'Your name is used to personalize your experience',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsManager.white),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  color: ColorsManager.inputColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                autofocus: true,
                controller: appCubit.nameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Your name',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: ColorsManager.hintTextColor),
                ),
              ),
            ),
            Spacer(),
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
                        AppRoutes.makeVocaScreen);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
