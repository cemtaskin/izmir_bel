import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:izmir_bel/components/hal_sebze_meyve_item.dart';
import 'package:izmir_bel/infrastructure/web_service.dart';
import 'package:izmir_bel/models/hal_fiyat_listesi.dart';

class HalMeyveSebzeListScreen extends StatefulWidget {
  const HalMeyveSebzeListScreen({super.key});

  @override
  State<HalMeyveSebzeListScreen> createState() =>
      _HalMeyveSebzeListScreenState();
}

class _HalMeyveSebzeListScreenState extends State<HalMeyveSebzeListScreen> {
  bool _isWorking = true;
  var _webService = webService();
  var _responseData = List.generate(0, (index) => HalFiyatListesi());
  var _searchTextInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchTextInputController.addListener(() {
      print(_searchTextInputController.text);
      setState(() {});
    });

    _webService.getHalFiyatlariSebzeMevye().then((value) {
      _isWorking = false;
      _responseData = value;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var _filteredList = _responseData
        .where((element) => element.malAdi!
            .toUpperCase()
            .contains(_searchTextInputController.text.toUpperCase()))
        .toList();

    return SafeArea(
      child: Scaffold(
        body: _isWorking
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'Arama'),
                      controller: _searchTextInputController,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _filteredList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HalSebzeMeyveItem(
                            halFiyatListesi: _filteredList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {},
        ),
      ),
    );
  }
}
