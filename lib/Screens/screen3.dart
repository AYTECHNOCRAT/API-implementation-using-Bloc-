import 'dart:convert';

import 'package:credicxo/BloC/lyrics/lyrics_bloc.dart';
import 'package:credicxo/BloC/lyrics/lyrics_event.dart';
import 'package:credicxo/BloC/lyrics/lyrics_state.dart';
import 'package:credicxo/data/Model/d3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  LyricsBloc lyricsbloc;

  @override
  void initState() {
    // TODO: implement initState
    lyricsbloc=BlocProvider.of<LyricsBloc>(context);
    lyricsbloc.add(FetchLyrics());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lyrics Screen'),
      ),
      body:Container(
        child: BlocListener(
            listener: (context,state){
              if(state is LyricsErrorState){

              }
            },
          child: BlocBuilder<LyricsBloc,LyricsState>(
              builder: (context,state){
                if(state is LyricsInitialState){
                  return buildLoadingUI();
                }else if(state is LyricsLoadingState){
                  return buildLoadingUI();
                }else if(state is LyricsLoadedstate){
                  return buildLoadedState(state.list);
                }else if(state is LyricsErrorState){
                  buildErrorUI(state.message);
                }
                return  null;

          }),
        ),
      ),
    );
  }


  Widget buildLoadingUI(){
    return Center(child: CircularProgressIndicator(backgroundColor: Colors.black),);
  }

   Widget buildLoadedState(Lyrics lyrics){
    return Container(
      child: Column(children: <Widget>[
        Text('Lyrics',style: TextStyle(fontSize: 16),),
        Text(lyrics.lyricsBody)
      ],),
    );
   }

    Widget buildErrorUI(String message){
     return Center(child: Text(message),);
    }





}
