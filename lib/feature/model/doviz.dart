class Doviz {
  USD? uSD;
  USD? eUR;
  USD? gBP;
  USD? bTC;
  USD? eTH;
  USD? gA;
  USD? c;
  USD? gAG;
  USD? xU100;

  Doviz(
      {this.uSD,
      this.eUR,
      this.gBP,
      this.bTC,
      this.eTH,
      this.gA,
      this.c,
      this.gAG,
      this.xU100});

  Doviz.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
    eUR = json['EUR'] != null ? USD.fromJson(json['EUR']) : null;
    gBP = json['GBP'] != null ? USD.fromJson(json['GBP']) : null;
    bTC = json['BTC'] != null ? USD.fromJson(json['BTC']) : null;
    eTH = json['ETH'] != null ? USD.fromJson(json['ETH']) : null;
    gA = json['GA'] != null ? USD.fromJson(json['GA']) : null;
    c = json['C'] != null ? USD.fromJson(json['C']) : null;
    gAG = json['GAG'] != null ? USD.fromJson(json['GAG']) : null;
    xU100 = json['XU100'] != null ? USD.fromJson(json['XU100']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD?.toJson();
    }
    if (eUR != null) {
      data['EUR'] = eUR?.toJson();
    }
    if (gBP != null) {
      data['GBP'] = gBP?.toJson();
    }
    if (bTC != null) {
      data['BTC'] = bTC?.toJson();
    }
    if (eTH != null) {
      data['ETH'] = eTH?.toJson();
    }
    if (gA != null) {
      data['GA'] = gA?.toJson();
    }
    if (c != null) {
      data['C'] = c?.toJson();
    }
    if (gAG != null) {
      data['GAG'] = gAG?.toJson();
    }
    if (xU100 != null) {
      data['XU100'] = xU100?.toJson();
    }
    return data;
  }
}

class USD {
  String? satis;
  String? alis;
  String? degisim;

  USD({this.satis, this.alis, this.degisim});

  USD.fromJson(Map<String, dynamic> json) {
    satis = json['satis'];
    alis = json['alis'];
    degisim = json['degisim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['satis'] = satis;
    data['alis'] = alis;
    data['degisim'] = degisim;
    return data;
  }
}
