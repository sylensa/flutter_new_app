import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class HttpCalls{

  doGet(String urlAfterBase) async {
    var headers = {
      'x-api-key': 'fgy6435678hghytr534qwe567890poijhgyftr543wesdrtfyu',
      'x-client' : 'mobile'
    };
    print("headers:$headers");
    var url = Uri.parse(urlAfterBase);
    print("url: $url");
    var js;
    js = await get(url, headers:headers);
    var decoded;
    log("decoded: ${js.body}");
    try {
      decoded = jsonDecode(js.body);
    } catch (e) {
      print(e);
    }
    return decoded;
  }
}