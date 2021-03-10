import 'package:credicxo/Screens/screen3.dart';
import 'package:credicxo/data/Model/d1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrackDetailScreen extends StatelessWidget {

  Track track;
  TrackDetailScreen({@required this.track});

  Future<Null> processData()async{

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Details"),
      ),
      body: ListView(children: <Widget>[
        Container(
          padding: EdgeInsets.all(3),
          child: Text("Id: " +track.trackId.toString()),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text("Artist Name: "+track.artistName,style: TextStyle(fontSize: 26),),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text("Track name: "+track.trackName,style: TextStyle(fontSize: 22),),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text("Album name: "+track.albumName,style: TextStyle(fontSize: 24),),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text("Lyrics Available: "+ (track.hasLyrics==1?"Yes":"No")),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text("time; "+track.updatedTime),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text("Subtitle: "+(track.hasSubtitles==1?"Yes":"No")),
        ),
        Container(
          padding: EdgeInsets.all(3),
          child: Text("Ratings: "+track.trackRating.toString()),
        ),
        RaisedButton(
          onPressed: ()=>LyricsScreen(track.trackId),
        ),
      ],),
    );
  }
}
