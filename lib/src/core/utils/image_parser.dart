import 'dart:convert';

class ImageUrlParser {
  static String parseImageUrl(String jsonString, {String fallback = "assets/images/44803.jpg"}) {
    try {
      List<dynamic> parsed = jsonDecode(jsonString);
      return parsed.isNotEmpty ? parsed[0] : fallback;
    } catch (e) {
      print('Error parsing image URL: $e');
      return fallback;
    }
  }
}