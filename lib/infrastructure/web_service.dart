import 'dart:convert';

import 'package:izmir_bel/models/isletmeler_response.dart';
import 'package:http/http.dart' as http;

class webService {
  var url = "openapi.izmir.bel.tr";

  Future<List<IsletmelerResponse>> getIsletmeler() async {
    var r = List.generate(0, (index) => IsletmelerResponse());

    try {
      var response =
          await http.get(Uri.https(url, '/api/ibb/turuncucember/isletmeler'));

      if (response.statusCode == 200) {
        r = IsletmelerResponse().getListFromJson(response.body);
      }
    } catch (e) {}

    return r; //return list
  }

  Future<IsletmelerResponse> getIsletmelerById(int id) async {
    var r = IsletmelerResponse();
    try {
      var response = await http
          .get(Uri.https(url, '/api/ibb/turuncucember/isletmeler/$id'));

      if (response.statusCode == 200) {
        r = IsletmelerResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {}

    return r;
  }
}
