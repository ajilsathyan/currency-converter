import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget widgetChild;
  final String heading;
  const CustomContainer(
      {Key? key, required this.widgetChild, required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SizedBox(
      width: w,
      height: h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            heading,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: whiteColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: w,
            height: 256,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.24),
                    spreadRadius: 0,
                    blurRadius: 24,
                    offset: Offset(0, 6),
                  ),
                ]),
            child: widgetChild,
          ),
          const SizedBox(
            height: 72,
          )
        ],
      ),
    );
  }
}
