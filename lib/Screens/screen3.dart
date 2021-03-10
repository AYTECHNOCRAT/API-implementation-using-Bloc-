import 'dart:convert';

import 'package:credicxo/data/Model/d3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LyricsScreen extends StatefulWidget {
  int id;
  LyricsScreen(this.id);
  @override
  _LyricsScreenState createState() => _LyricsScreenState(id);
}

class _LyricsScreenState extends State<LyricsScreen> {


  int id;
  _LyricsScreenState(this.id);
  var data;
  String lyrics;
  Future<Lyrics> getLyrics() async {
    // TODO: implement getTracks
    var response = await http.get("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=${id.toString()}&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    data=json.decode(response.body);
//    if(response.statusCode==200){
//      data=json.decode(response.body);
      //lyrics=data['lyrics_body'].toString();
//      //List<TrackList> a=API__ResultModel.fromJson(data).message.body.trackList;
//      return data;
//    }else{
//      throw Exception();
//    }
  return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    getLyrics();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lyrics Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text("Click for Lyrics"),onPressed: (){
              getLyrics();
              print(data);
            }),
            Text(data.toString()),
            //Text()
          ],
        ),
      ),
    );
  }
}
