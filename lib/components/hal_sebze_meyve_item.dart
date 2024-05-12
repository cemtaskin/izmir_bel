import 'package:flutter/material.dart';
import 'package:izmir_bel/models/hal_fiyat_listesi.dart';

class HalSebzeMeyveItem extends StatelessWidget {
  final HalFiyatListesi? halFiyatListesi;
  const HalSebzeMeyveItem({super.key, this.halFiyatListesi});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tabela Adı:'),
              Text(halFiyatListesi!.malAdi!),
            ],
          ),
          Container(
            color: Colors.grey.shade300,
            height: 1.0,
            width: double.infinity,
          ),
          Text(halFiyatListesi!.malTipAdi!),
          Container(
            color: Colors.grey.shade300,
            height: 1.0,
            width: double.infinity,
          ),
          Image.network(
              'https://eislem.izmir.bel.tr/YuklenenDosyalar/HalGorselleri/${halFiyatListesi!.gorsel!}'),
          Container(
            color: Colors.grey.shade300,
            height: 1.0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
