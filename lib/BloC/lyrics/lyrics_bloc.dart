import 'package:bloc/bloc.dart';
import 'package:credicxo/BloC/lyrics/lyrics_event.dart';
import 'package:credicxo/BloC/lyrics/lyrics_state.dart';
import 'package:credicxo/data/Model/d3.dart';
import 'package:credicxo/data/repository/api_C_reepository.dart';
import 'package:flutter/cupertino.dart';

class LyricsBloc extends Bloc<LyricsEvent, LyricsState>{
  LyricsRepository repository;
  LyricsBloc({@required this.repository});

  @override
  // TODO: implement initialState
  LyricsState get initialState => LyricsInitialState();

  @override
  Stream<LyricsState> mapEventToState(LyricsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchLyrics) {
      yield LyricsLoadingState();
      try {
        Lyrics lyrics = await repository.getLyrics();
        yield LyricsLoadedstate(list: lyrics);
      } catch (e) {
        yield LyricsErrorState(message: e.toString());
      }
    }
  }

}