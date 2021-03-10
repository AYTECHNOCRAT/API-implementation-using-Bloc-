import 'package:credicxo/data/Model/d1.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TrackState extends Equatable{}

class TrackInitialState extends TrackState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TrackLoadingState extends TrackState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TrackLoadedstate extends TrackState{
  @override

  List<TrackList> list;
  TrackLoadedstate({@required this.list});
  // TODO: implement props
  List<Object> get props => null;
}

class TrackErrorState extends TrackState{

  String message;
  TrackErrorState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
