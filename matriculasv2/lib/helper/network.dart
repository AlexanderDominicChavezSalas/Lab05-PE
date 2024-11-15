import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  final String _baseURL =
      "http://192.168.0.7:3000/api/v1"; //cambiar segun tu localhost

  get(String url) async {
    try {
      final response = await http.get(Uri.parse(_baseURL + url));
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      }
    } catch (e) {
      //print(e);
      rethrow;
    }
  }

  post(String url, Map<String, dynamic> data) async {
    try {
      String jsondata = json.encode(data);
      final response = await http.post(
        Uri.parse(_baseURL + url),
        body: jsondata,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Devuelve el cuerpo de la respuesta como JSON
        return json.decode(response.body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error en post: $e");
      rethrow;
    }
  }

  put(String url, Map<String, dynamic> data) async {
    try {
      String jsondata = json.encode(data);
      final response =
          await http.put(Uri.parse(_baseURL + url), body: jsondata, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        //var responseJson = json.decode(response.body.toString());
        //return responseJson;
        return true;
      }
    } catch (e) {
      //print(e);
      rethrow;
    }
  }

  delete(String url) async {
    try {
      final response = await http.delete(Uri.parse(_baseURL + url));
      if (response.statusCode == 200) {
        //var responseJson = json.decode(response.body.toString());
        //return responseJson;
        return true;
      }
    } catch (e) {
      //print(e);
      rethrow;
    }
  }
}
