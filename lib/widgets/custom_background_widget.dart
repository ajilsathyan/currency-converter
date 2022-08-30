import 'package:currency_convertor/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          Expanded(
              flex: 7,
              child: Container(
                decoration: const BoxDecoration(gradient: linearGradient),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: whiteColor,
              )),
        ],
      ),
    );
  }
}
