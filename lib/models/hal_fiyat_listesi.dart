class HalFiyatListesi {
  num? ortalamaUcret;
  String? malAdi;
  String? birim;
  num? asgariUcret;
  num? azamiUcret;
  int? malId;
  String? tarih;
  int? halTuru;
  int? malTipId;
  String? malTipAdi;
  String? gorsel;

  HalFiyatListesi(
      {this.ortalamaUcret,
      this.malAdi,
      this.birim,
      this.asgariUcret,
      this.azamiUcret,
      this.malId,
      this.tarih,
      this.halTuru,
      this.malTipId,
      this.malTipAdi,
      this.gorsel});

  HalFiyatListesi.fromJson(Map<String, dynamic> json) {
    ortalamaUcret = json['OrtalamaUcret'];
    malAdi = json['MalAdi'];
    birim = json['Birim'];
    asgariUcret = json['AsgariUcret'];
    azamiUcret = json['AzamiUcret'];
    malId = json['MalId'];
    tarih = json['tarih'];
    halTuru = json['HalTuru'];
    malTipId = json['MalTipId'];
    malTipAdi = json['MalTipAdi'];
    gorsel = json['Gorsel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrtalamaUcret'] = this.ortalamaUcret;
    data['MalAdi'] = this.malAdi;
    data['Birim'] = this.birim;
    data['AsgariUcret'] = this.asgariUcret;
    data['AzamiUcret'] = this.azamiUcret;
    data['MalId'] = this.malId;
    data['tarih'] = this.tarih;
    data['HalTuru'] = this.halTuru;
    data['MalTipId'] = this.malTipId;
    data['MalTipAdi'] = this.malTipAdi;
    data['Gorsel'] = this.gorsel;
    return data;
  }
}
