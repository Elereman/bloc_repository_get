import 'package:bloc_repository_get/flutter/bloc/home_page/state.dart';

abstract class HomePageEvent {
  HomePageState reduce(HomePageState state);
}