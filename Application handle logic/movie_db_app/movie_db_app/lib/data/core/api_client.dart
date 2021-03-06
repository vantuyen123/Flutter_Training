import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_db_app/data/core/api_constants.dart';

import 'UnauthorisedException.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic> params}) async {
    final response = await _client.get(
      Uri.parse(getPath(path, params)),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // await Future.delayed(Duration(milliseconds: 2000));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic> params}) async {
    final response = await _client.post(Uri.parse(getPath(path, null)),
        body: jsonEncode(params),
        headers: {
          'Content-type': 'application/json',
        });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic> params}) async {
    Request request = Request('DELETE', Uri.parse(getPath(path, null)));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(params);
    final response = await _client.send(request).then(
          (value) => Response.fromStream(value),
         );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path, Map<dynamic, dynamic> params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    print(
        '_Client.get(${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString)');
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}
