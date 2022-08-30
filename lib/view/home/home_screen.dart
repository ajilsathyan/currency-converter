import 'package:currency_convertor/constants/app_colors.dart';
import 'package:currency_convertor/constants/styles.dart';
import 'package:currency_convertor/widgets/custom_background_widget.dart';
import 'package:currency_convertor/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/currency_controller.dart';
import '../../widgets/custom_container_widget.dart';
import '../data_submit/email_submit_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> currencyTypes = ['INR', 'USD', 'EUR'];

  FocusNode focusNode = FocusNode();

  TextEditingController amountText = TextEditingController();
  TextEditingController convertText = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CurrencyController>(context, listen: false).getCurrency();
    });
    super.initState();
  }

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
            Consumer<CurrencyController>(builder: (context, p, c) {
              return CustomContainer(
                  heading: "Currency Converter",
                  widgetChild: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amount",
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
                                controller: amountText,
                                keyboardType: TextInputType.number,
                                onChanged: p.getInputRateFromUser,
                                decoration: inputDecoration(
                                  isBorderShow: true,
                                  isFullBorderShow: false,
                                ),
                              ),
                            ),
                            Container(
                              width: 96,
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 9),
                              decoration: const BoxDecoration(
                                  color: dropDownContainerColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const ImageIcon(
                                    AssetImage("assets/icons/down-arrow.png"),
                                    size: 11.0,
                                    color: whiteColor,
                                  ),
                                  hint: Text(
                                    p.defaultSelectedValue,
                                    style: const TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  items: currencyTypes
                                      .map((e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    p.selectFirstDropDownAmount(
                                        value as String);
                                    p.updateRateToUi();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Convert to",
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
                              child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.fromLTRB(16, 9, 16, 9),
                                decoration: const BoxDecoration(
                                    color: filledColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    )),
                                child: Text(
                                  p.convertedMoney,
                                  style: textFormStyle,
                                ),
                              ),
                            ),
                            Container(
                              width: 96,
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 9),
                              decoration: const BoxDecoration(
                                  color: dropDownContainerColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const ImageIcon(
                                    AssetImage("assets/icons/down-arrow.png"),
                                    size: 11.0,
                                    color: whiteColor,
                                  ),
                                  hint: Text(
                                    p.secondSelectedDefaultValue,
                                    style: const TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  items: currencyTypes
                                      .map((e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    p.selectSecondDropDownAmount(
                                        value as String);
                                    p.updateRateToUi();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      CustomButtonWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SubmitScreen()));
                        },
                        title: "Next",
                        isIconShow: true,
                      ),
                    ],
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
