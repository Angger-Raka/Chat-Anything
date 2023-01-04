import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getImageUrl(String prompt) async {
  String url = 'https://api.openai.com/v1/images/generations';
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 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',
  };
  String json = '{"prompt": "$prompt", "n": 2, "size": "1024x1024"}';

  http.Response response =
      await http.post(Uri.parse(url), headers: headers, body: json);

  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    return responseJson['data'][0]['url'];
  } else {
    throw Exception('Failed to get image URL');
  }
}
