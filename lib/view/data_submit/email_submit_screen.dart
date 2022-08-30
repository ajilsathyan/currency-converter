import 'package:currency_convertor/constants/app_colors.dart';
import 'package:currency_convertor/view/success/success_screen.dart';
import 'package:currency_convertor/widgets/custom_background_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_container_widget.dart';

class SubmitScreen extends StatelessWidget {
  SubmitScreen({Key? key}) : super(key: key);

  FocusNode focusNode = FocusNode();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: w,
        height: h,
        child: Stack(
          children: [
            const CustomBackgroundWidget(),
            CustomContainer(
                heading: "Data Submitter",
                widgetChild: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: regularTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: textFormStyle,
                              focusNode: focusNode,
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: inputDecoration(
                                isBorderShow: true,
                                isFullBorderShow: true,
                                filledColor: whiteColor,
                              ),
                            ),
                          ),
                          // Container(
                          //   width: 96,
                          //   height: 40,
                          //   padding:
                          //   EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          //   decoration: const BoxDecoration(
                          //       color: dropDownContainerColor,
                          //       borderRadius: BorderRadius.only(
                          //         bottomRight: Radius.circular(4),
                          //         topRight: Radius.circular(4),
                          //       )),
                          //   child: DropdownButtonHideUnderline(
                          //     child: DropdownButton<String>(
                          //       icon: const ImageIcon(
                          //         AssetImage("assets/icons/down-arrow.png"),
                          //         size: 11.0,
                          //         color: whiteColor,
                          //       ),
                          //       hint: Text(
                          //         selectedValue,
                          //         style: TextStyle(
                          //             color: whiteColor,
                          //             fontWeight: FontWeight.w600),
                          //       ),
                          //       items: currencyTypes
                          //           .map((e) => DropdownMenuItem<String>(
                          //         child: Text(e),
                          //         value: e,
                          //       ))
                          //           .toList(),
                          //       onChanged: (value) {
                          //         selectedValue = value as String;
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Email",
                      style: regularTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: textFormStyle,
                              focusNode: focusNode,
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: inputDecoration(
                                isBorderShow: true,
                                isFullBorderShow: true,
                                filledColor: whiteColor,
                              ),
                            ),
                          ),
                          // Container(
                          //   width: 96,
                          //   height: 40,
                          //   padding:
                          //   EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          //   decoration: const BoxDecoration(
                          //       color: dropDownContainerColor,
                          //       borderRadius: BorderRadius.only(
                          //         bottomRight: Radius.circular(4),
                          //         topRight: Radius.circular(4),
                          //       )),
                          //   child: DropdownButtonHideUnderline(
                          //     child: DropdownButton<String>(
                          //       icon: const ImageIcon(
                          //         AssetImage("assets/icons/down-arrow.png"),
                          //         size: 11.0,
                          //         color: whiteColor,
                          //       ),
                          //       hint: Text(
                          //         selectedValue,
                          //         style: TextStyle(
                          //             color: whiteColor,
                          //             fontWeight: FontWeight.w600),
                          //       ),
                          //       items: currencyTypes
                          //           .map((e) => DropdownMenuItem<String>(
                          //         child: Text(e),
                          //         value: e,
                          //       ))
                          //           .toList(),
                          //       onChanged: (value) {
                          //         selectedValue = value as String;
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomButtonWidget(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SuccessScreen()));
                      },
                      title: "Submit",
                      isIconShow: false,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
