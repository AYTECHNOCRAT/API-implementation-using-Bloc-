import 'package:credicxo/data/Model/d3.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LyricsState extends Equatable{}

class LyricsInitialState extends LyricsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LyricsLoadingState extends LyricsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LyricsLoadedstate extends LyricsState{
  @override

  Lyrics list;
  LyricsLoadedstate({@required this.list});
  // TODO: implement props
  List<Object> get props => null;
}

class LyricsErrorState extends LyricsState{

  String message;
  LyricsErrorState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
