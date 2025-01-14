import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class WidgetWithButton extends StatefulWidget {
  final String title;
  final String subTitle;
  final String buttonText;
  final String image;
  final bool showSizedBox;
  final Function() onTap;

  const WidgetWithButton(
      {super.key,
      required this.title,
      required this.subTitle,
      this.showSizedBox = true,
      required this.onTap,
      required this.buttonText,
      required this.image});

  @override
  State<WidgetWithButton> createState() => _WidgetWithButtonState();
}

class _WidgetWithButtonState extends State<WidgetWithButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // Initialize Slide Animation for Button
    _buttonAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Starts off-screen at the bottom
      end: Offset(0, 0), // Ends in its original position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start Animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.showSizedBox)
            SizedBox(
              height: 60.v,
            ),
          Image.asset(
            widget.image,
            width: double.infinity,
            height: 400.v,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Text(
                //   widget.subTitle,
                //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                //       fontWeight: FontWeight.w500, color: ColorsManager.white),
                //   textAlign: TextAlign.center,
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      widget.subTitle,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.white),
                      textAlign: TextAlign.center,
                      // duration: Duration(seconds: 1),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ],
            ),
          ),
          Spacer(),
          SlideTransition(
            position: _buttonAnimation,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: CustomButton(
                  text: widget.buttonText,
                  onTap: widget.onTap,
                )),
          ),
        ],
      ),
    );
  }
}
