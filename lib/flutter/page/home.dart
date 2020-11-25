import 'package:bloc_repository_get/flutter/bloc/home_page/bloc.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/bloc_status.dart';
import 'package:bloc_repository_get/flutter/bloc/home_page/state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomePageBloc _bloc;

  const HomePage({@required HomePageBloc bloc, Key key})
      : _bloc = bloc,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<HomePageState>(
        stream: _bloc.stateStream,
        builder: (BuildContext context, AsyncSnapshot<HomePageState> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.status == BlocStatus.Loaded) {
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(index.toString());
                },
              );
            } else if (snapshot.data.status == BlocStatus.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.status == BlocStatus.Error) {
              return const Center(
                child: Text(
                  'Error',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
