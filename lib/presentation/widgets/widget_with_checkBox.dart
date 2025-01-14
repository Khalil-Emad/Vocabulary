import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class WidgetWithCheckBox extends StatelessWidget {
  final String title;
  final String subTitle;
  final String routeName;
  final List<String> listToShow;
  final List<String> selectedList;
  final bool goalScreen;

  const WidgetWithCheckBox(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.listToShow,
      required this.selectedList,
      required this.goalScreen,
      required this.routeName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.v,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(height: 10),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsManager.white),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: listToShow.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: selectedList.contains(listToShow[index])
                                  ? 1.3
                                  : 1,
                              color: selectedList.contains(listToShow[index])
                                  ? ColorsManager.white
                                  : ColorsManager.white.withOpacity(.5)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          )),
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          bool value = selectedList.contains(listToShow[index]);
                          if (goalScreen) {
                            appCubit.onChangeGoalsSelection(
                                value: !value, goal: goals[index]);
                          } else {
                            appCubit.onChangeTopicSelection(
                                value: !value, topic: topics[index]);
                          }
                        },
                        child: ListTile(
                          title: Text(listToShow[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 16)),
                          trailing: Transform.scale(
                            scale: 1.4,
                            child: Checkbox(
                              value: selectedList.contains(listToShow[index]),
                              onChanged: (value) {
                                HapticFeedback.selectionClick();
                                if (goalScreen) {
                                  appCubit.onChangeGoalsSelection(
                                      value: value, goal: goals[index]);
                                } else {
                                  appCubit.onChangeTopicSelection(
                                      value: value, topic: topics[index]);
                                }
                              },
                              activeColor: ColorsManager.buttonColor,
                              checkColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15.v,
                  );
                },
              ),
            ),
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
                    NavigatorService.pushNamedAndRemoveUntil(routeName);
                  },
                )),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
