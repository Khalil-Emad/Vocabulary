import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class WdgetWithRadio extends StatelessWidget {
  final String title;
  final String subTitle;
  final int groupValue;
  final bool showSkip;
  final List<String> listToShow;
  final Function(dynamic value) onChange;

  const WdgetWithRadio(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.groupValue,
      required this.onChange,
      required this.listToShow,
      this.showSkip = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showSkip)
              Column(
                children: [
                  SizedBox(
                    height: 50.v,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigatorService.pushNamedAndRemoveUntil(
                              AppRoutes.homeScreen);
                        },
                        child: Text("Skip",
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorsManager.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(
              height: showSkip ? 30.v : 100.v,
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
              textAlign: TextAlign.center,
              subTitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsManager.white),
            ),
            SizedBox(
              height: 550.v,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: listToShow.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: groupValue == index
                                ? ColorsManager.white
                                : ColorsManager.white.withOpacity(.5)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        )),
                    child: GestureDetector(
                      onTap: () => onChange(index),
                      child: ListTile(
                        title: Text(listToShow[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16)),
                        trailing: Transform.scale(
                          scale: 1.5,
                          child: Radio(
                              activeColor: ColorsManager.white,
                              value: index,
                              groupValue: groupValue,
                              onChanged: onChange),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15.v,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
