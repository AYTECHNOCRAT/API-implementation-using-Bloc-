import 'package:credicxo/BloC/trACKS/track_bloc.dart';
import 'package:credicxo/data/repository/api_a_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => TrackBloc(repository: TracksRepository(),),
        child: TracksListScreen(),
      ),
    );
  }
}

