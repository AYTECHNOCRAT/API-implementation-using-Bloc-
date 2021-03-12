import 'package:credicxo/BloC/trACKS/trac_state.dart';
import 'package:credicxo/BloC/trACKS/track_bloc.dart';
import 'package:credicxo/BloC/trACKS/track_event.dart';
import 'package:credicxo/Screens/screen2.dart';
import 'package:credicxo/Screens/screen3.dart';
import 'package:credicxo/data/Model/d1.dart';
import 'package:credicxo/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TracksListScreen extends StatefulWidget {
  @override
  _TracksListState createState() => _TracksListState();
}

class _TracksListState extends State<TracksListScreen> {

  TrackBloc trackBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trackBloc=BlocProvider.of<TrackBloc>(context);
    trackBloc.add(FetchTracks());
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Builder(
          builder: (context){
            return Material(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Credicxo Music App'),
                  actions: <Widget>[
                  ],
                ),
                body: Container(
                  child: BlocListener<TrackBloc,TrackState>(
                    listener: (context,state){
                      if(state is TrackErrorState){
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message),));
                      }
                    },
                    child: BlocBuilder<TrackBloc,TrackState>(
                        builder: (context,state){
                          if(state is TrackInitialState){
                            return buildLoading();
                          }else if(state is TrackLoadingState){
                            return buildLoading();
                          }else if(state is TrackLoadedstate){
                            return buildTrackList(state.list);
                          }else if(state is TrackErrorState){
                            return buildErrorUI(state.message);
                          }
                          return null;
                        }
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
  
  Widget buildLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  
  Widget buildErrorUI(String message){
    return Center(child: Padding(
      padding: EdgeInsets.all(12),
      child: Text(message,style: TextStyle(color: Colors.red),),
    ),
    );
  }
  
  Widget buildTrackList(List<TrackList> tracks){
    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (ctx,pos){
        return Padding(
          padding: EdgeInsets.all(5),
          child: InkWell(
            child: Container(
              //decoration: BoxDecoration(),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(width: 30,child: Text(tracks[pos].track.trackRating.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                    title: Text(tracks[pos].track.trackName,style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
                    subtitle: Text(tracks[pos].track.albumName),

                  ),
                  Row(children: <Widget>[
                    SizedBox(width: 70,),
                    Text("Artist name: "+tracks[pos].track.artistName,style: TextStyle(fontSize: 14),)
                  ],)
                ],
              ),

            ),
            onTap: ()=> navigateToTrackDetailsScreen(ctx, tracks[pos].track),//na
            onDoubleTap: ()=>navigateToLyricsDetailsScreen(ctx, tracks[pos].track.trackId),// vigateToScreen()
          ),
        );
      },
    );
    
  }

  void navigateToTrackDetailsScreen(BuildContext context,Track tracks){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return TrackDetailScreen(track: tracks);
    }));

  }
  void navigateToLyricsDetailsScreen(BuildContext context,int trackId){

    Navigator.push(context, MaterialPageRoute(builder: (context){
      //AllStrings(id: trackId.toString());
      return LyricsScreen(trackId);
    }));

  }
}
