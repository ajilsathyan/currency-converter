import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  bool isIconShow;
  Function onTap;
  String title;
  CustomButtonWidget(
      {Key? key,
      required this.isIconShow,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: 40,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(primary: buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: whiteColor),
            ),
            if (isIconShow)
              const SizedBox(
                width: 8.8,
              ),
            if (isIconShow)
              const ImageIcon(
                AssetImage("assets/icons/arrow.png"),
                size: 20.0,
                color: whiteColor,
              ),
          ],
        ),
      ),
    );
  }
}
