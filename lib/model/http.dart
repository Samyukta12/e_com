//euta class banau
// tya bhitra euta function banau jasle chai hhtp ko method lai hanlde garos

// getAPi(String url){
//   // await  http.get(wrl);
//   return resp;
//
// }
import 'package:e_com/model/item_model.dart';
import 'package:http/http.dart'as http;



class ApiRequest{
  List<Items> items=[];
  getApi(String url) async{
   await http.get(Uri.parse(url)).then((response) {


   items.addAll(itemsFromJson(response.body));


     return items;

   });
  }


}