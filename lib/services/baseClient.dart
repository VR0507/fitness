import 'dart:convert';

import 'package:fitness/services/api_conts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class BaseClient {
  var client = http.Client();

  Future<dynamic> post(String api, dynamic object) async {
    var header = {'Content-type': 'application/json'};
    try {
      var uri = Uri.parse(ApiConst.baseUrl + api);
      var payload = json.encode(object);
      print(payload);
      var response = await client.post(uri, body: payload, headers: header);

      print(response.statusCode);
      developer.log(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('post error== ${e.toString()}');
    }
  }
}
