import 'package:currency_convertor/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration: const BoxDecoration(
          gradient: linearGradient,
        ),
        child: const Center(
          child: Text(
            "Thank You!",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: whiteColor),
          ),
        ),
      ),
    );
  }
}
