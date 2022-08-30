import 'dart:convert';

import 'package:currency_convertor/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/get_money_model.dart';

class CurrencyController with ChangeNotifier {
  RateModel? data;

  int inputMoney = 0;

  String INR = '';
  String USD = '';
  String EUR = '';

  String defaultSelectedValue = 'INR';
  String secondSelectedDefaultValue = 'USD';
  String convertedMoney = '';

  Future<void> getCurrency() async {
    Response response = await ApiServices().getCurrencyRate();
    try {
      if (response.statusCode == 200) {
        RateModel rateModel = RateModel.fromJson(jsonDecode(response.body));
        data = rateModel;
        INR = data!.rates!.iNR.toString();
        USD = data!.rates!.uSD.toString();
        EUR = data!.rates!.eUR.toString();
        notifyListeners();
      } else {
        throw "error";
      }
    } catch (e) {
      throw "Error";
    }
  }

  getInputRateFromUser(String value) {
    if (value != null) {
      inputMoney = int.parse(value);
      updateRateToUi();
    } else {
      return null;
    }
  }

  updateRateToUi() {
    if (defaultSelectedValue == secondSelectedDefaultValue) {
      print("true");
      convertedMoney = inputMoney.toString();
      notifyListeners();
    } else if (defaultSelectedValue != secondSelectedDefaultValue) {
      switch (secondSelectedDefaultValue) {
        case "INR":
          convertedMoney =
              (double.parse(inputMoney.toString()) / double.parse(INR))
                  .toStringAsFixed(3);
          notifyListeners();
          break;
        case "EUR":
          convertedMoney =
              (double.parse(inputMoney.toString()) / double.parse(EUR))
                  .toStringAsFixed(3);
          notifyListeners();
          break;
      }
    }
  }

  selectFirstDropDownAmount(String type) {
    defaultSelectedValue = type;
    notifyListeners();
  }

  selectSecondDropDownAmount(String type) {
    secondSelectedDefaultValue = type;
    notifyListeners();
  }
}
