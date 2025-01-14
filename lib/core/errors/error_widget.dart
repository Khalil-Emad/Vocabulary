import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DefaultErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child:  Center(
          child: Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Text(
             "حصل خطأ برجاء التواصل مع الخادم",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

}