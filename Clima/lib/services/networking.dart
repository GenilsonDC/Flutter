import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = convert.jsonDecode(data);

      print('🟢🟢🟢🟢🟢 Status 200 - OK 🟢🟢🟢🟢🟢 \n');
      return decodeData;
    } else {
      print(
          '🟡🟡🟡🟡🟡 Request failed with status: ${response.statusCode} 🟡🟡🟡🟡🟡');
      return null;
    }
  }
}
