import 'package:http/http.dart' as http;

class DDApi {
  final String ApiLink = "https://www.dnd5eapi.co/api/";

  Future<String> fetchSkills() async {
    final response = await http.get(Uri.parse( ApiLink + "skills/"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
