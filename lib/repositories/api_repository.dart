import 'package:digitaldungeons/repositories/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DDApiRepository extends Repository {
  final String baseUrl = "https://www.dnd5eapi.co/api/";

  DDApiRepository(): super();

  Future<Map<String, dynamic>> fetchSpells() async {
    return fetchUrl("skills/");
  }

  Future<Map<String, dynamic>> fetchUrl(String page) async {
    final response = await http.get(Uri.parse(baseUrl + page));
    if (response.statusCode == 200) {
      return toMapFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Map<String, dynamic> toMapFromJson(String responseBody) {
    return json.decode(responseBody).cast<Map<String, dynamic>>();
  }

}
