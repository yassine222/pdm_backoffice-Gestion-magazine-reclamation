import 'package:http/http.dart' as https;
import 'package:pdm_backoffice/config.dart';
import 'package:pdm_backoffice/models/reclamation_model.dart';

class MagazineHelper {
  static var client = https.Client();

  static Future<List<GetAllReclamationRes>> getReclamation() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };

    var url = Uri.http(Config.apiUrl, Config.reclamationUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var postsList = getAllReclamationResFromJson(response.body);
      return postsList;
    } else {
      throw Exception("Failed to get Reclamation");
    }
  }

  static Future<bool> deleteReclamation(String postId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, "${Config.reclamationUrl}/$postId");
    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateReclamation(String postId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, "${Config.reclamationUrl}/$postId");
    var response = await client.put(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
