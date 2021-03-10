import 'package:bloc/bloc.dart';
import 'package:credicxo/BloC/trACKS/trac_state.dart';
import 'package:credicxo/BloC/trACKS/track_event.dart';
import 'package:credicxo/data/Model/d1.dart';
import 'package:credicxo/data/repository/api_a_repository.dart';
import 'package:flutter/cupertino.dart';

class TrackBloc extends Bloc<TrackEvent,TrackState>{
  TracksRepository repository;
  TrackBloc({@required this.repository});
  @override
  // TODO: implement initialState
  TrackState get initialState => TrackInitialState();

  @override
  Stream<TrackState> mapEventToState(TrackEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchTracks){
      yield TrackLoadingState();
      try{
        List<TrackList> tracks= await repository.getTracks();
        yield TrackLoadedstate(list: tracks);
      }catch(e){
        yield TrackErrorState(message: e.toString());
      }


    }
  }

}