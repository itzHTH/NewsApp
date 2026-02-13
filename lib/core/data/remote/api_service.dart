import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/data/remote/api_config.dart';

abstract class IApiService {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters});
}

class HttpApiService implements IApiService {
  @override
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    String url = "${ApiConfig.baseUrl}$endpoint?apiKey=${ApiConfig.apiKey}";
    if (queryParameters != null) {
      // add query parameters to url
      queryParameters.forEach((key, value) {
        url += "&$key=$value";
      });
    }
    // make http request
    var response = await http.get(Uri.parse(url));
    // decode response
    var data = jsonDecode(response.body);
    if (data["status"] == "ok") {
      return data["articles"];
    } else {
      throw Exception(data["message"]);
    }
  }
}
