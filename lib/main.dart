import 'package:bloc_repository_get/flutter/bloc/home_page/bloc.dart';
import 'package:bloc_repository_get/service_locator.dart' as di;
import 'package:flutter/material.dart';

import 'flutter/page/home.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(bloc: di.sl.get<HomePageBloc>()),
    );
  }
}
