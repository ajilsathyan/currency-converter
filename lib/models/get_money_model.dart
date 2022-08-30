class RateModel {
  String? disclaimer;
  String? license;
  int? timestamp;
  String? base;
  Rates? rates;

  RateModel(
      {this.disclaimer, this.license, this.timestamp, this.base, this.rates});

  RateModel.fromJson(Map<String, dynamic> json) {
    disclaimer = json['disclaimer'];
    license = json['license'];
    timestamp = json['timestamp'];
    base = json['base'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
  }
}

class Rates {
  double? iNR;
  int? uSD;
  double? eUR;

  Rates({
    this.eUR,
    this.uSD,
    this.iNR,
  });

  Rates.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] as int;
    iNR = json['INR'] as double;
    eUR = json['EUR'] as double;
  }
}
