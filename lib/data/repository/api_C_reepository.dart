import 'dart:convert';

import 'package:credicxo/data/Model/d3.dart';
import 'package:http/http.dart' as http;

abstract class API_C_Repository{
  Future<Lyrics> getLyrics();
}
class LyricsRepository implements API_C_Repository{
  @override
  Future<Lyrics> getLyrics() async{
    // TODO: implement getLyrics
    var response= await http.get("");
    if(response.statusCode==200){
      var data=json.decode(response.body);
      Lyrics a=API_C_ResultModel.fromJson(data).message.body.lyrics;
      return a;
    }else{
      throw Exception();
    }
  }

}