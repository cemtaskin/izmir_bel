import 'dart:convert';

class IsletmelerResponse {
  String? eklenmeTarihi;
  String? lokasyonY;
  String? lokasyonX;
  int? id;
  String? faaliyetAlani;
  String? ticariUnvan;
  String? tabelaAdi;
  int? faaliyetId;

  IsletmelerResponse(
      {this.eklenmeTarihi,
      this.lokasyonY,
      this.lokasyonX,
      this.id,
      this.faaliyetAlani,
      this.ticariUnvan,
      this.tabelaAdi,
      this.faaliyetId});

  IsletmelerResponse.fromJson(Map<String, dynamic> json) {
    eklenmeTarihi = json['EklenmeTarihi'];
    lokasyonY = json['LokasyonY'];
    lokasyonX = json['LokasyonX'];
    id = json['Id'];
    faaliyetAlani = json['FaaliyetAlani'];
    ticariUnvan = json['TicariUnvan'];
    tabelaAdi = json['TabelaAdi'];
    faaliyetId = json['FaaliyetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EklenmeTarihi'] = this.eklenmeTarihi;
    data['LokasyonY'] = this.lokasyonY;
    data['LokasyonX'] = this.lokasyonX;
    data['Id'] = this.id;
    data['FaaliyetAlani'] = this.faaliyetAlani;
    data['TicariUnvan'] = this.ticariUnvan;
    data['TabelaAdi'] = this.tabelaAdi;
    data['FaaliyetId'] = this.faaliyetId;
    return data;
  }

  List<IsletmelerResponse> getListFromJson(String data) {
    return (json.decode(data) as List)
        .map((e) => IsletmelerResponse.fromJson(e))
        .toList();
  }
}
