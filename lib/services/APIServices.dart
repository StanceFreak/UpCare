import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:emr_mobile/model/ArticleResponse.dart';
import 'package:emr_mobile/model/Results.dart';
import 'package:http/http.dart' as http;

class APIServices {
  // use this if you're running the apps on the emulator
  static const baseUrl = 'http://10.0.2.2:3000';

  // use this if you're running the apps on the physical device
  // and use command "adb reverse tcp:(api port) tcp:(api port) in the terminal"
  // static const baseUrl = 'http://localhost:3000';

  static Future<List> getListArticles() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + '/articles/page/1'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> responseData = jsonResponse['results'];
        log(jsonResponse.toString());
        return responseData;
        // return jsonResponse.map((data) => Article.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<List> getTrendingArticles() async {
    try {
      final response =
          await http.get(Uri.parse(baseUrl + '/articles-trending'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        // List<dynamic> responseData = jsonResponse['results'];
        log(jsonResponse.toString());
        return jsonResponse;
        // return jsonResponse.map((data) => Article.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<List> getMedicineCategories() async {
    try {
      final response =
          await http.get(Uri.parse(baseUrl + '/medicine/categories'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> responseData = jsonResponse['results'];
        log(jsonResponse.toString());
        return responseData;
        // return jsonResponse.map((data) => Article.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<List> getMedicineListBySlug(String slug) async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl + '/medicine/categories/' + slug + '/page/1'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> responseData = jsonResponse['result'];
        log(jsonResponse.toString());
        return responseData;
        // return jsonResponse.map((data) => Article.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
