// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcus_web/common/api_constant.dart';
import 'package:parcus_web/domain/core/error.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Uri _getPath(String path, Map<dynamic, dynamic>? params, bool isParsing) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((dynamic key, dynamic value) {
        paramsString += '?$key=$value';
      });
    }
    return isParsing
        ? Uri.parse('${ApiConstants.PARSING_URL}$path')
        : Uri.parse('${ApiConstants.BASE_URL}$path.php$paramsString');
  }

  dynamic post(
    String path, {
    Map<dynamic, dynamic>? params,
  }) async {
    final response = await _client.post(
      _getPath(path, null, false),
      body: jsonEncode(params),
      headers: {
        "Access-Control-Allow-Headers": "*",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.body.contains('"error":')) {
      throw ServerException<dynamic>(erorr: json.decode(response.body));
    } else if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
      // return json.decode(response.body);
    } else if (response.statusCode == 400) {
      print('error 400');
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic get(
    String path, {
    String? token,
    bool isParsing = false,
    Map<dynamic, dynamic>? params,
  }) async {
    final response = await _client.get(
      _getPath(path, params, isParsing),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
    );
    print(response.body.contains('"error": true'));
    print(response.body.toString());
    // if (response.body.contains('"error": true')) {
    //   throw ServerException<String>(erorr: response.body);
    // } else
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      print('error 400');
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
