import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class NetWorkingService {
  NetWorkingService(this.url);
  final Uri url;
  
  Future getData() async{
    http.Response response = await http.get(url);
    
    if (response.statusCode == 200){
      String data = response.body;
      var decodedData = convert.jsonDecode(data);
      print('🟢🟢🟢🟢🟢 Status 200 - OK 🟢🟢🟢🟢🟢 \n');
      return decodedData;
    }else{
      print('🔴🔴🔴🔴🔴 Status ${response.statusCode} - Error 🔴🔴🔴🔴🔴');
      return null;
    }
  }
}