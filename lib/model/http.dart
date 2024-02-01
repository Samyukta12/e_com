//euta class banau
// tya bhitra euta function banau jasle chai hhtp ko method lai hanlde garos

// getAPi(String url){
//   // await  http.get(wrl);
//   return resp;
//
// }
import 'package:e_com/model/item_model.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  getApi(String url) async {
    return await http.get(Uri.parse(url)).then((response) {
      return response.body;
    });
  }
}
