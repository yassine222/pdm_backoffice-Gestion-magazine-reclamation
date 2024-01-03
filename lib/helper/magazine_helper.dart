import 'package:http/http.dart' as https;
import 'package:pdm_backoffice/config.dart';
import 'package:pdm_backoffice/models/magazine_model.dart';

class MagazineHelper {
  static var client = https.Client();

  static Future<List<GetAllMagazineRes>> getMagazines() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };

    var url = Uri.http(Config.apiUrl, Config.magazineUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var postsList = getAllMagazineResFromJson(response.body);
      return postsList;
    } else {
      throw Exception("Failed to get Magazine");
    }
  }

  static Future<bool> deleteMagazine(String postId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, "${Config.magazineUrl}/$postId");
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
}
