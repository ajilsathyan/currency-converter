import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle regularTextStyle = const TextStyle(
  color: regularFontColor,
  fontSize: 14,
);

TextStyle textFormStyle = const TextStyle(
    color: Color(0xFF232B2E), fontSize: 14, fontWeight: FontWeight.w600);

InputDecoration inputDecoration(
        {Color? filledColor,
        required bool isBorderShow,
        required bool isFullBorderShow}) =>
    InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
      filled: true,
      fillColor: filledColor ?? whiteColor,
      border: isBorderShow
          ? OutlineInputBorder(
              borderRadius: isFullBorderShow
                  ? BorderRadius.circular(4)
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      topLeft: Radius.circular(4)),
              borderSide: const BorderSide(color: borderColor, width: 1),
            )
          : null,
    );
