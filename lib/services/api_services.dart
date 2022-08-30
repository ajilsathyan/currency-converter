import 'package:currency_convertor/constants/apis.dart';
import 'package:http/http.dart';

class ApiServices {
  Future<Response> getCurrencyRate() async {
    return await get(
        Uri.parse(Apis.BASE_URL + Apis.EXCANGE_RATE + Apis.APP_ID));
  }
}
