import 'package:credicxo/data/Model/d1.dart';
import 'package:credicxo/res/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class  API_A_Repository{
  Future<List<TrackList>> getTracks();
}

class TracksRepository implements API_A_Repository{
  @override
  Future<List<TrackList>> getTracks() async {
    // TODO: implement getTracks
    var response= await http.get(AllStrings.API_A_URL);
    if(response.statusCode==200){
      var data=json.decode(response.body);
      List<TrackList> a=API_A_ResultModel.fromJson(data).message.body.trackList;
      return a;
    }else{
      throw Exception();
    }
  }

}