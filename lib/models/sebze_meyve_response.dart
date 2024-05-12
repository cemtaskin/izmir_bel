import 'package:izmir_bel/models/hal_fiyat_listesi.dart';

class SebzeMeyveResponse {
  String? bultenTarihi;
  List<HalFiyatListesi>? halFiyatListesi;

  SebzeMeyveResponse({this.bultenTarihi, this.halFiyatListesi});

  SebzeMeyveResponse.fromJson(Map<String, dynamic> json) {
    bultenTarihi = json['BultenTarihi'];
    if (json['HalFiyatListesi'] != null) {
      halFiyatListesi = <HalFiyatListesi>[];
      json['HalFiyatListesi'].forEach((v) {
        halFiyatListesi!.add(new HalFiyatListesi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BultenTarihi'] = this.bultenTarihi;
    if (this.halFiyatListesi != null) {
      data['HalFiyatListesi'] =
          this.halFiyatListesi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
