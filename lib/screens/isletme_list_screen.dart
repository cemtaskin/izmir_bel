import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izmir_bel/components/isletme_item.dart';
import 'package:izmir_bel/infrastructure/web_service.dart';
import 'package:izmir_bel/models/isletmeler_response.dart';

class IsletmeListScreen extends StatefulWidget {
  const IsletmeListScreen({super.key});

  @override
  State<IsletmeListScreen> createState() => _IsletmeListScreenState();
}

class _IsletmeListScreenState extends State<IsletmeListScreen> {
  bool _isWorking = true;
  var _webService = webService();
  var _responseData = List.generate(0, (index) => IsletmelerResponse());
  var _searchTextInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchTextInputController.addListener(() {
      print(_searchTextInputController.text);
      setState(() {});
    });

    _webService.getIsletmeler().then((value) {
      setState(() {
        _isWorking = false;
        _responseData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _filteredList = _responseData
        .where((element) =>
            element.tabelaAdi!.contains(_searchTextInputController.text))
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
                          return IsletmeItem(
                            isletmelerResponse: _filteredList[index],
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
