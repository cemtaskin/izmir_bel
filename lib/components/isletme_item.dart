import 'package:flutter/material.dart';
import 'package:izmir_bel/models/isletmeler_response.dart';

class IsletmeItem extends StatelessWidget {
  final IsletmelerResponse? isletmelerResponse;
  const IsletmeItem({super.key, this.isletmelerResponse});

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
              Text(isletmelerResponse!.tabelaAdi!),
            ],
          ),
          Container(
            color: Colors.grey.shade300,
            height: 1.0,
            width: double.infinity,
          ),
          Text(isletmelerResponse!.faaliyetAlani!),
          Container(
            color: Colors.grey.shade300,
            height: 1.0,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(isletmelerResponse!.ticariUnvan!)),
            ],
          ),
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
